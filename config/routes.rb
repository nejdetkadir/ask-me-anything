Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # general
  get ':id', to: 'pages#profile', as: :profile_page
  get 'pages/explore', to: 'pages#explore', as: :explore_page
end
