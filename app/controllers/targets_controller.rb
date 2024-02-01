class TargetsController < ApplicationController
  before_action(:target_find, only: %i[edit update destroy])

  def index
    @targets = Target.order(id: :desc)
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    if @target.save then
      flash[:notice] = 'Успешно создано'
      redirect_to(targets_path)
    else
      flash.now[:danger] = 'Ошибка ввода'
      render(:new)
    end
  end

  def edit

  end

  def update
    if @target.update(target_params) then
      flash[:notice] = 'Успешно обновлено'
      redirect_to(targets_path)
    else
      flash.now[:danger] = 'Ошибка ввода'
      render(:edit)
    end
  end

  def destroy
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
