Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # users
  post ':id', to: 'users#create_friend', as: :send_friend_request

  # general
  get ':id', to: 'pages#profile', as: :profile_page
  get 'pages/explore', to: 'pages#explore', as: :explore_page
end
