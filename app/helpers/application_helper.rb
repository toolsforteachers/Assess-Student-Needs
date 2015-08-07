module ApplicationHelper
  def link_to_group
    link_to "Class: #{ @group.name }", group_path(@group)
  end

  def likert_style(score)
    case score.to_i
      when 5 then 'success'
      when 4 then 'info'
      when 3 then 'active'
      when 2 then 'warning'
      when 1 then 'danger'
    end
  end

  def glyph(name, icon)
    s = "<span class='span glyphicon glyphicon-#{ icon }'></span> "
    s += name if name
    raw s
  end
end
