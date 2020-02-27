class UsersController < ApplicationController
before_action :authenticate_user, {only: [:index, :show, :edit, :update]}

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
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: "user_icon.jpg",
      password: params[:password]
    )
    if @user.save
      session[:password] = @user.password
      session[:user_id] = @user.id
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

  # ログインフォームのアクション
  def login_form
  end

  # ログインのアクション
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  # ログアウトのアクション
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

end
