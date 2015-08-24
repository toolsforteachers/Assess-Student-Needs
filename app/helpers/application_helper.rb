module ApplicationHelper
  def link_to_group(group=nil)
    group ||= @group
    link_to group, group_lessons_path(group)
  end

  def progress_style(score)
    case score
      when 1 then :score_100
      when 0.8..1 then :score_80
      when 0.6..0.8 then :score_60
      when 0.4..0.6 then :score_40
      when 0.2..0.4 then :score_20
      else
        :score_0
    end
  end

  def glyph(name, icon)
    s = "<span class='span glyphicon glyphicon-#{ icon }'></span> "
    s += name if name
    raw s
  end

  def discussion_path(indicator)
    "/discuss/#{ indicator.to_param }"
  end
end
