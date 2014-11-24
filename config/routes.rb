Vdrova::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  mount Mercury::Engine => '/'
  mount OrdinaryCms::Engine => '/'
  ActiveAdmin.routes(self)
  resource :orders, only: [:new, :create]
  resources :pages, only: :show
end
