Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'posts#index'
  resources :posts
  devise_for :admins

  # resources :admin
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
