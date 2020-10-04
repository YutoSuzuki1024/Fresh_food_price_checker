Rails.application.routes.draw do
  devise_for :members
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #メンバートップに関するルーティング
  root "home#top"
  get "home/about" => "home#about", as: :about

  resources :members
  get "members/:id/leave" => "members#leave", as: :leave
  patch "members/:id/out" => "members#out", as: :members_out

  resources :items

  #投稿に関するルーティング
  get "members/:member_id/posts" => "posts#index", as: :posts_index
  post "members/:member_id/items/:item_id/posts" => "posts#create", as: :posts_create
  get "members/:member_id/items/:item_id/posts/new" => "posts#new", as: :posts_new
  get "members/:member_id/items/:item_id/posts/:id/edit" => "posts#edit", as: :posts_edit
  get "members/:member_id/items/:item_id/posts/:id" => "posts#show", as: :posts_show
  patch "members/:member_id/items/:item_id/posts/:id" => "posts#update", as: :posts_update
  delete "posts/:id" => "posts#destroy", as: :posts_destroy
  post "members/:member_id/items/:item_id/posts/new_confirm" => "posts#new_confirm", as: :posts_new_confirm

  #お問い合わせに関するルーティング
  get "inquiries/complete" => "inquiries#complete", as: :inquiries_complete
  resources :inquiries
  post "inquiries/confirm" => "inquiries#confirm", as: :inquiries_confirm
end
