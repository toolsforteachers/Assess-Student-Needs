module ApplicationHelper
  def link_to_group
    link_to @group.name, group_path(@group)
  end
end
