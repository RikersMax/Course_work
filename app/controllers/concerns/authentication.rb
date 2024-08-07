module Authentication
  extend ActiveSupport::Concern

  included do
    private

    def require_authentcation
      return unless current_user.nil?

      redirect_to(root_path)
    end

    def require_no_authentcation
      return unless user_signed_in?

      flash[:info] = 'Вы уже вошли в систему'
      redirect_to(root_path)
    end

    def current_user
      if session[:user_id].present?
        @current_user ||= User.find_by(id: session[:user_id])
      elsif cookies.encrypted[:user_id].present?
        user = User.find_by(id: cookies.encrypted[:user_id])
        if user&.remember_token_authenticated?(cookies.encrypted[:remember_token])
          sign_in(user)
          @current_user ||= user
        end
      end
    end

    def user_signed_in?
      current_user.present?
    end

    def sign_in(user)
      session[:user_id] = user.id
    end

    def remember(user)
      user.remember_me
      cookies.encrypted.permanent[:remember_token] = user.remember_token
      cookies.encrypted.permanent[:user_id] = user.id
    end

    def forget(user)
      user.forget_me
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
    end

    def sign_out
      session.delete(:user_id)
    end

    helper_method(:current_user, :user_signed_in?) # методы доступны в views
  end
end
