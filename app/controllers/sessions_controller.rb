class SessionsController < ApplicationController
  before_action(:require_no_authentcation, only: %i[new create])
  def new; end

  def create
    user = User.find_by(login: params[:login])
    if user&.persisted? && user.password == params[:password]
      sign_in(user)
      remember(user) if params[:remember_me] == '1'
      flash[:notice] = 'Вы вошли'
      redirect_to(root_path)
    else
      flash.now[:danger] = 'Ошибка ввода'
      render(:new)
    end
  end

  def destroy
    forget(current_user)
    sign_out
    flash[:notice] = 'Вы вышли'
    redirect_to(root_path)
  end
end
