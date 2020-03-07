Rails.application.routes.draw do
  # 言い値のルーティング
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  # ログインのルーティング
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  # ユーザー一覧のルーティング
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
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
