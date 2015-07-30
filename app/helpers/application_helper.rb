module ApplicationHelper
  def link_to_group
    link_to @group.name, group_path(@group)
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
end
