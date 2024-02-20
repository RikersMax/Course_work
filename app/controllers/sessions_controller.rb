class SessionsController < ApplicationController
  before_action(:require_no_authentcation, only: %i[new create])
  def new

  end

  def create
    user = User.find_by(login: params[:login])
    if user&.persisted? then
      sign_in(user) if user.password == params[:password]
      flash[:notice] = 'Вы вошли в систему'
      redirect_to(root_path)
    else
      flash[:danger] = 'Ошибка ввода'
      render(:new)
    end
  end

  def destroy
    sign_out
    flash[:notice] = 'Вы вышли из системы'
    redirect_to(root_path)
  end

end
