Rails.application.routes.draw do
  # 投稿のルーティング
  get "posts/index"

  # homeのルーティング
  get "/" => "home#top"
  get "about" => "home#about"
end
