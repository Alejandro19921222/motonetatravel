Rails.application.routes.draw do
  get 'message/:id' => "messages#show", as: "message"
  delete 'message/:id' => "messages#destroy"
  resources :messages, only: [:create]

  devise_for :users
  resources :users,only: [:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get "confirm"
  end
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  get 'finder' => "finders#finder"
  root to: 'posts#index'
end
