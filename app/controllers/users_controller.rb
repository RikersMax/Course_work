class UsersController < ApplicationController
  before_action(:require_authentcation)
  before_action(:role_select, only: %i[new create show edit])
  before_action(:user_find, only: %i[show edit update destroy])


  def index
    role_check([4, 5])
    @users = User.order(id: :asc)
  end

  def new
    role_check([4, 5])
    @user = User.new
  end

  def create
    role_check([4, 5])
    #render(plain: employee_params.to_yaml) and return
    @user = User.new(user_params)


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
    role_check([4, 5])
  end

  def update
    role_check([4, 5])
    if @user.update(user_params)
      flash[:notice] = "Параметры пользователя #{@user.fio} обновлены"
      redirect_to(users_path)
    else
      flash.now[:danger] = @user.errors.full_messages
      render(:edit)
    end
  end

  def destroy
    role_check([4, 5])
    if current_user == @user
      flash[:danger] = "Вы не можете удалить сами себя"
      redirect_to(users_path)
    else
      @user.destroy
      flash[:info] = "#{name} удален"
      redirect_to(users_path)
    end
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role_id, :login, :password, :fio)
  end

  def role_select
    @role = Role.order(id: :asc).map {|r| [r.name, r.id]}
  end

end
