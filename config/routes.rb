Rails.application.routes.draw do
  # 投稿のルーティング
  get "posts/index" => "posts#index"
  get "posts/:id" => "posts#show"

  # homeのルーティング
  get "/" => "home#top"
  get "about" => "home#about"
end
