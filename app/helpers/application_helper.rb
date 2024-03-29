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

  def consumption_arrival(object)
    if object == 'Приход' then
      return("<sapn style='color: #60b56e;'>#{object}</span>".html_safe)
    elsif object == 'Расход' then
      return("<sapn style='color: #9c2b2e;'>#{object}</span>".html_safe)
    end
  end

  def negative_number(object)
    if object < 0 then
      return("<span class='text-danger'>#{object}</sapn>".html_safe)
    else
      return(object)
    end
  end

  def currently_at(current_page = '')
    render(partial: 'shared/menu', locals: {current_page: current_page})
  end

  def currently_at_prod(current_page = '')
    render(partial: 'shared/mini_bar_prod', locals: {current_page: current_page})
  end

  def currently_at_order(current_page = '')
    render(partial: 'shared/mini_bar_order', locals: {current_page: current_page})
  end

  def currently_at_storage(current_page = '')
    render(partial: 'shared/mini_bar_storage', locals: {current_page: current_page})
  end

  def currently_at_user(current_page = '')
    render(partial: 'shared/mini_bar_user', locals: {current_page: current_page})
  end



end
