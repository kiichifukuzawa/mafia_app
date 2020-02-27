class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

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

  end
end
