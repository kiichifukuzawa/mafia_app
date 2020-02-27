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
    @user = User.new
  end

  # createアクション
  def create
    @user = User.new(name: params[:name], email: params[:email], image_name: "user_icon.jpg")
    if @user.save
      flash[:notice] = "ユーザー登録が成功しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  # ユーザー情報の編集
  def edit
    @user = User.find_by(id: params[:id])
  end

  # update アクション
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    # 画像を保存する処理
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end




end
