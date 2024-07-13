class UsersController < ApplicationController
  before_action(:require_authentcation)
  before_action(:role_head_manager, only: %i[new create update destroy edit])
  before_action(:employee_select, only: %i[new create show])
  before_action(:role_select, only: %i[new create show edit])
  before_action(:user_find, only: %i[show edit update destroy])

  def index
    @users = User.order(id: :asc)
  end

  def new
    @employee = Employee.new
    @user = User.new
  end

  def create
    #render(plain: employee_params.to_yaml) and return
    @user = User.new(user_params)
    @employee = Employee.new(employee_params)
    if !@employee.save then
      flash.now[:danger] = @employee.errors.full_messages
      render(:new)
    end

    @user.employee_id = @employee.id
    if @user.save
      flash[:notice] = 'Вы создали пользователя'
      redirect_to(users_path)
    else
      flash.now[:danger] = @user.errors.full_messages
      render(:new)
    end
  end

  def show

  end

  def edit

  end

  def update
    @employee = Employee.find(@user.employee_id)
    if !@employee.update(employee_params)
      flash.now[:danger] = @employee.errors.full_messages
      render(:edit)
    end

    if @user.update(user_params)
      flash[:notice] = "Параметры пользователя #{@user.employee.name} обновлены"
      redirect_to(users_path)
    else
      flash.now[:danger] = @user.errors.full_messages
      render(:edit)
    end
  end

  def destroy
    @employee = Employee.find(@user.employee_id)

    if current_user == @user
      flash[:danger] = "Вы не можете удалить сами себя"
      redirect_to(users_path)
    else
      name = @employee.name
      @user.destroy
      @employee.destroy
      flash[:info] = "#{name} удален"
      redirect_to(users_path)
    end
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role_id, :login, :password)
  end

  def employee_select
    @employee = Employee.order(name: :asc).map {|e| [e.name, e.id]}
  end

  def role_select
    @role = Role.order(id: :asc).map {|r| [r.name, r.id]}
  end

  def employee_params
    params.require(:user).permit(:name, :number)
  end
end
