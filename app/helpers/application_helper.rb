module ApplicationHelper
  def submit_text(form_object, if_exists: 'exists', if_not_exists: 'not exists')
    form_object.object.persisted? ? if_exists : if_not_exists
  end

  def currect_date(object)
    object.strftime('%Y-%m-%d')
  end

  def current_title(page_title=nil)
    base_title = 'CS'
    if page_title.present?
      return(" #{base_title} | #{page_title}")
    else
      return(base_title)
    end
  end

  def nav_tab(title, url, options={})
    current_page = options.delete(:current_page)
    class_css = current_page == title ? 'secondary-link' : 'color-link'

    if options[:class] then
      options[:class] = options[:class] + ' ' + class_css
    else
      options[:class] = class_css
    end

    return(link_to(title, url, options))
  end

  def currently_at(current_page = '')
    render(partial: 'shared/menu', locals: {current_page: current_page})
  end

  def currently_at_prod(current_page = '')
    render(partial: 'shared/mini_bar_prod', locals: {current_page: current_page})
  end
end
