module ApplicationHelper
  def submit_text(form_object, if_exists: 'exists', if_not_exists: 'not exists')
    form_object.object.persisted? ? if_exists : if_not_exists
  end

  def currect_date(object)
    object.strftime('%Y-%m-%d')
  end

  def current_title(page_title = nil)
    base_title = 'CS'
    return(" #{base_title} | #{page_title}") if page_title.present?

    base_title
  end

  def nav_tab(title, url, options = {})
    current_page = options.delete(:current_page)
    class_css = current_page == title ? 'secondary-link' : 'color-link'

    options[:class] = if options[:class]
                        options[:class] + ' ' + class_css
                      else
                        class_css
                      end

    link_to(title, url, options)
  end

  def consumption_arrival(object)
    if object == 'Приход'
      "<sapn style='color: #60b56e;'>#{object}</span>".html_safe
    elsif object == 'Расход'
      "<sapn style='color: #9c2b2e;'>#{object}</span>".html_safe
    end
  end

  def negative_number(object)
    return("<span class='text-danger'>#{object}</sapn>".html_safe) if object < 0

    object
  end

  def currently_at(current_page = '')
    render(partial: 'shared/menu', locals: { current_page: })
  end

  def currently_at_prod(current_page = '')
    render(partial: 'shared/mini_bar_prod', locals: { current_page: })
  end

  def currently_at_order(current_page = '')
    render(partial: 'shared/mini_bar_order', locals: { current_page: })
  end

  def currently_at_storage(current_page = '')
    render(partial: 'shared/mini_bar_storage', locals: { current_page: })
  end

  def currently_at_user(current_page = '')
    render(partial: 'shared/mini_bar_user', locals: { current_page: })
  end
end
