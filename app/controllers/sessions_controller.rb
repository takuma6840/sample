class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    employee = Employee.find_by(employee_id: session_params[:employee_id])

    if employee&.authenticate(session_params[:password])
      session[:employee_num] = employee.id
      session[:employee_name] = employee.name
      redirect_to root_url, notice: "#{employee.name}ログインしました。"
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'ログアウトしました'
  end

  private

  def session_params
    params.require(:session).permit(:employee_id, :password)
  end
end
