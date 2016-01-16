module ApplicationHelper

  def active_if(controller_name)
    raw("class='active'") if params[:controller].to_s == controller_name.to_s
  end

end
