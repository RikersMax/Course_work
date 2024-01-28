module ApplicationHelper
  def submit_text(form_object, if_exists: 'exists', if_not_exists: 'not exists')
    form_object.object.persisted? ? if_exists : if_not_exists
  end

  def correct_date(object)
    object.strftime('%Y-%m-%d')
  end

  def corrent_title

  end
end
