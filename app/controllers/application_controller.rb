class ApplicationController < ActionController::Base
  helper_method :current_user, :abc, :current_employee, :current_employee_name, :emp_name, :abc123
  before_action :login_required


  private

  def current_user
    @current_user = session[:user_id]
  end

  def abc
    @abc = session[:user_name]
  end

  def abc123
    @abc123 = session[:nameabc]
  end

  def current_employee
    @current_employee ||= Employee.find_by(id: session[:employee_num]) if session[:employee_num]
  end

  def current_employee_name
    @current_employee_name = session[:employee_name]
  end

  def emp_name
    @emp_name =   session[:emp_name]
  end

  def login_required
    redirect_to login_url unless current_employee
  end
end
