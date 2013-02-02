module LayoutHelper
  def flash_message(name, message)
    content_tag(:div, id: "flash_#{name}", class: "alert alert-#{flash_class name}") do
      raw( message + link_to('x', '#', class:'close', data: {dismiss:'alert'}))
    end.html_safe
  end

  def flash_class(name)
    case name.to_s.downcase
      when "notice" then 'success'
      when 'alert' then 'error'
      else name
    end
  end

  def title(page_title, show_title = true)
    @show_title = show_title
    content_for(:title, page_title.to_s)
  end

  def show_title?
    return content_for?(:title) && @show_title
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  
end