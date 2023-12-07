module ApplicationHelper
  def rendering_show_chapter
    params[:controller] == "chapters" && params[:action] == "show"
  end

  def hide_footer
    unless current_page?('/chats') || current_page?('/gptchats')
      render "shared/footer"
    end
  end
end
