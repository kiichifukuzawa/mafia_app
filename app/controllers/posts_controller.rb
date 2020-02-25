class PostsController < ApplicationController
  def index
    @posts = ["ゴマラテの作成手順", "チーズケーキの作り方"]
  end
end
