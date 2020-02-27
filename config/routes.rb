Rails.application.routes.draw do
  get 'users/index'
  # 投稿のルーティング
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  # 投稿を送信するためのルーティング
  post "posts/create" => "posts#create"
  # 投稿編集のルーティング
  get "posts/:id/edit" => "posts#edit"
  # 編集した値を受け取る
  post "posts/:id/update" => "posts#update"
  # 削除機能へのルーティング
  post "posts/:id/destroy" => "posts#destroy"

  # homeのルーティング
  get "/" => "home#top"
  get "about" => "home#about"
end
