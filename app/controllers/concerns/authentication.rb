module Authentication
  extend ActiveSupport::Concern

  included do
    private

    def require_authentcation
      if current_user == nil then
        redirect_to(root_path)
      end
    end

    def require_no_authentcation
      return if !user_signed_in?

      flash[:info] = 'Вы уже вошли в систему'
      redirect_to(root_path)
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
    end

    def user_signed_in?
      current_user.present?
    end

    def sign_in(user)
      session[:user_id] = user.id
    end

    def sign_out
      session.delete(:user_id)
    end

    helper_method(:current_user, :user_signed_in?) # методы доступны в views
  end
end
