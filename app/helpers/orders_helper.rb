module OrdersHelper
  def date_exists?(form_object)
    form_object.object.date ? form_object.object.date : Time.now
  end
end
