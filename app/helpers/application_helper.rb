module ApplicationHelper
  def link_to_group
    link_to "Class: #{ @group.name }", group_path(@group)
  end

  def progress_style(score)
    case score
      when 1 then :success
      when 0.8..1 then :info
      when 0.6..0.8 then :active
      when 0.4..0.6 then :warning
      when 0.2..0.4 then :danger
    end
  end

  def glyph(name, icon)
    s = "<span class='span glyphicon glyphicon-#{ icon }'></span> "
    s += name if name
    raw s
  end
end
