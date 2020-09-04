class UsersController < ApplicationController
  def index
    @user = User.all
    session[:emp_name] = current_employee_name
  end

  def show
    @user = User.find(params[:id])
    session[:user_id] = @user.id
    session[:user_name] = @user.name
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
    redirect_to users_url, notice: "#{@user.name}様を登録しました"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to user_url, notice: "#{user.name}様を更新しました。"
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_url, notice: "#{user.name}様を削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :telephonenumber, :birthday, :gender, :address)
  end
end
