Rails.application.routes.draw do
  devise_for :users, skip: [:passwords]
  root to: 'homes#top'
  get 'about' => 'homes#about'

  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#guest_sign_in'
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resources :tweets, only: [:show, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :replies, only: [:create, :destroy]
    end
    resources :study_times, only: [:create, :destroy, :edit, :update]
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :topics, only: [:index, :show, :create, :new] do
    resources :comments, only: [:create]
  end
  get 'search' => 'searches#search'
end
