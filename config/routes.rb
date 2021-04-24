Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # resources
  resources :asks

  # users
  post ':id', to: 'users#create_friend', as: :send_friend_request
  post ':id/accept', to: 'users#accept_friend', as: :accept_friend_request
  post ':id/decline', to: 'users#decline_friend', as: :decline_friend_request
  post ':id/remove', to: 'users#remove_friend', as: :remove_friend_request

  # updates of user
  patch ':id/update', to: 'users#update', as: :update_user

  # general
  get ':id', to: 'pages#profile', as: :profile_page
  get 'pages/explore', to: 'pages#explore', as: :explore_page
  get 'pages/requested-friends', to: 'pages#requested_friends', as: :requested_friends_page
end
