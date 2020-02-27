class PostsController < ApplicationController
  # 投稿一覧
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # 投稿詳細
  def show
    @post = Post.find_by(id:params[:id])
  end

# 新規投稿画面のアクション
  def new
    @post = Post.new
  end

# 新規投稿のアクション
  def create
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  # 投稿編集画面のアクション
  def edit
    @post = Post.find_by(id: params[:id])
  end

  # 編集した内容を更新する
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]

    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("/posts/edit")
    end
  end

  #投稿の削除
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

end
