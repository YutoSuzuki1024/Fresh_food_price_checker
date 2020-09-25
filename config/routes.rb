Rails.application.routes.draw do
  devise_for :members
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :members
  get "members/:id/leave" => "members#leave", as: :leave
  patch "members/:id/out" => "members#out", as: :members_out
end
