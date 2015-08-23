require 'rubygems'
require 'nokogiri'
require 'open-uri'

class GdsCurriculumPage
  attr_accessor :page, :subject, :level, :topic, :prompt, :objective, :node

  def initialize(page_url, subject, curriculum)
    @page = Nokogiri::HTML(open(page_url))

    @subject = Indicator.create!(
      type: 'Indicators::Subject',
      name: subject || @page.at_css('h1').inner_html,
      curriculum: curriculum)

    #start at the first relevant level
    @node = @page.css('h2').select{ |n| /^Year/.match(n.inner_html) }.first

    while @node do
      check_h2
      check_h3
      check_p
      check_ul
      check_call_to_action
      @node = @node.next_element
    end
  end

  def check_h2
    if @node.name == 'h2'
      reset_all

      if /^Year/.match(@node.inner_html)
        @level = @subject.children.create!(
          type: 'Indicators::Level',
          name: @node.inner_html.gsub(' programme of study', ''))
      end
    end
  end

  def check_h3
    if @node.name == 'h3' && @level

      # note - this might exist for the same level
      @topic = Indicators::Topic.find_by(name: @node.inner_html, parent_id: @level.id)
      @topic ||= @level.children.create!(
        type: 'Indicators::Topic',
        name: @node.inner_html)
    end
  end

  def check_p
    if @node.name == 'p' && (@strand || @topic)
      parent = @strand || @topic
      @prompt = parent.children.create!(
        type: 'Indicators::Prompt',
        name: @node.inner_html)
    end
  end

  def check_ul
    if @node.name == 'ul'
      parent = @prompt || @topic
      if parent
        @node.css('li').each do |li|
          next if li.blank?

          if li.css('ul li').blank?
            # prevent nested objectives being created at the incorrect (upper) level
            unless li.css_path.match /ul.*.li.*>.ul.* >.li.*/
              parent.children.create!(
                type: 'Indicators::Objective',
                name: li.inner_html)
            end
          else
            # this is a nested li ul lu
            # the outer li becomes the Prompt
            # and the inner li is the Objective

            next if li.children.first.text.blank?

            sub_prompt = parent.children.create!(
              type: 'Indicators::Prompt',
              name: li.children.first.text)

            li.css('ul').each do |li_ul|
              next if li.blank?

              li_ul.css('li').each do |li_ul_li|
                sub_prompt.children.create!(
                  type: 'Indicators::Objective',
                  name: li_ul_li.inner_html)
              end
            end
          end
        end
      end
    end
  end

  def check_call_to_action
    if @node.attr('class') == 'call-to-action'
      parent = @topic
      # attach a note to the parent
    end
  end

  def reset_all
     @level, @topic, @prompt = nil, nil, nil
  end
end
