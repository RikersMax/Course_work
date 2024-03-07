class EmployeesController < ApplicationController
  before_action(:employee_find, only: %i[show edit update destroy])

  def index
    @employees = Employee.order(id: :desc)
  end

  def show

  end

  def edit

  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save then
      flash[:notice] = 'Сотрудник добавлен'
      redirect_to(employees_path)
    else
      flash.now[:danger] = @employee.errors.full_messages
      render(:new)
    end
  end

  def update
    if @employee.update(employee_params) then
      flash[:notice] = 'Профиль сотрудника изменен'
      redirect_to(employees_path)
    else
      flash.now[:danger] = @employee.errors.full_messages
      render(:edit)
    end
  end

  def destroy
    @employee.destroy
    flash[:info] = 'Сотрудник удален'
    redirect_to(employees_path)
  end


  private

  def employee_find
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :number)
  end

end
