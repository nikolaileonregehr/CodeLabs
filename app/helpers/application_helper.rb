module ApplicationHelper
  def rendering_show_chapter
    params[:controller] == "chapters" && params[:action] == "show"
  end
end
