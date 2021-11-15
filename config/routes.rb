Rails.application.routes.draw do
  resources :study_times
  resources :comments
  resources :topics
  resources :favorites
  resources :replies
  resources :relationships
  resources :tweets
  root to: 'homes#top'
  devise_for :users
end
