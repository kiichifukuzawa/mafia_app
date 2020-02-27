class UsersController < ApplicationController
  # ユーザー一覧のアクション
  def index
    @users = User.all
  end

  # ユーザーの詳細
  def show
    @user = User.find_by(id: params[:id])
  end

  #ユーザーの新規登録
  def new

  end

  # createアクション
  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      flash[:notice] = "ユーザー登録が成功しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
  end
end
