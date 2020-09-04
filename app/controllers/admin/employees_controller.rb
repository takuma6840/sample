class Admin::EmployeesController < ApplicationController
  before_action :require_admin

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to admin_employee_url(@employee), notice: "ユーザー: #{@employee.name}を登録しました"
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def index
    @employee = Employee.all
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      redirect_to admin_employee_url(@employee), notice: "#{@employee.nemw}を登録しました"
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to admin_employee_url, notice: "ユーザー#{@employee.name}を削除しました。"
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :employee_id, :admin, :password, :password_confirmation)
  end

  def require_admin
    redirect_to root_url unless current_employee.admin?
  end
end
