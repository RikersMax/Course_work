class TargetsController < ApplicationController
  before_action(:require_authentcation)
  before_action(:target_find, only: %i[edit update destroy])

  def index
    @targets = Target.order(id: :desc)
  end

  def new
    role_check([3, 4, 5])
    @target = Target.new
  end

  def edit
    role_check([3, 4, 5])
  end

  def create
    role_check([3, 4, 5])
    @target = Target.new(target_params)
    if @target.save
      flash[:notice] = 'Успешно создано'
      redirect_to(targets_path)
    else
      flash.now[:danger] = 'Ошибка ввода'
      render(:new)
    end
  end

  def update
    role_check([3, 4, 5])
    if @target.update(target_params)
      flash[:notice] = 'Успешно обновлено'
      redirect_to(targets_path)
    else
      flash.now[:danger] = 'Ошибка ввода'
      render(:edit)
    end
  end

  def destroy
    role_check([3, 4, 5])
    @target.destroy
    flash[:info] = "#{@target.name} удалено"
    redirect_to(targets_path)
  end

  private

  def target_find
    @target = Target.find(params[:id])
  end

  def target_params
    params.require(:target).permit(:name)
  end
end
