class UsersController < ApplicationController
  before_action(:require_authentcation)
  before_action(:employee_select, only: %i[new create])
  before_action(:role_select, only: %i[new create])

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save then
      flash[:notice] = 'Вы создали пользователя'
      redirect_to(root_path)
    else
      flash[:danger] = @user.errors.full_messages
      render(:new)
    end
  end

  private

  def user_find
    @user = User.find(:id)
  end

  def user_params
      params.require(:user).permit(:employee_id, :role_id, :login, :password)
  end

  def employee_select
    @employee = Employee.order(name: :asc).map{|e| [e.name, e.id]}
  end

  def role_select
    @role = Role.order(id: :asc).map{|r| [r.name, r.id]}
  end
end
