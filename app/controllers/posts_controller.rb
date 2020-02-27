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

  end

# 新規投稿のアクション
  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end

  # 投稿編集画面のアクション
  def edit
    @post = Post.find_by(id: params[:id])
  end

  # 編集した内容を更新する
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save

    redirect_to("/posts/index")
  end

  #投稿の削除
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end

end
