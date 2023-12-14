module ApplicationHelper
  def submit_title(form_object)
    form_object.object.persisted? ? 'Изменить' : 'Создать'
  end
end
