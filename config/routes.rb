Rails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'searches/result'
  get '/posts/hashtag/:name', to: 'posts#hashtags'
  get 'searches/result'
  get 'pages/about'
  get 'pages/mypage'
  get 'pages/ad'
  get 'pages/privacy'
  get 'pages/customer'
  get 'pages/rules'
  get 'pages/myinfo'

  get '/posts/search', to: "posts#search"

  post '/posts/search', to: "posts#search"
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  resources :post_attachments

  resources :posts

  resources :categories

  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
