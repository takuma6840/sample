class ContentsController < ApplicationController

  def index
    @content = Content.where(user_id: abc)
    @user = User.find(current_user)
  end

  def show
    @content = Content.where(user_id: current_user)
    @user = User.find(current_user)
  end

  def new
    @content = Content.new
    @user = User.find(current_user)
  end

  def create
    @user = User.find(current_user)
    content = Content.new(content_params.merge(
    user_id: @user.name).merge(reactor: emp_name))
    content.save!
    redirect_to contents_url, notice: " 内容を登録しました"
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = Content.find(params[:id])
    content.update!(content_params.merge(
    user_id: create_user).merge(reactor: emp_name))
    redirect_to contents_url, notice: "内容を更新しました。"
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy
    redirect_to contents_url, notice: "内容を削除しました。"
  end

  private

  def content_params
    params.require(:content).permit(:content, :datetime,)
  end
end
