module ApplicationHelper
  def current_role
    (current_user || current_owner)
  end
end
