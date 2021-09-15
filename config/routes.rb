Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  post '/items/:id', to: 'items#update'#updateアクションに送ろうとするとPOSTを辿ってしまうため、強制的にパスを書き換える
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: :create
  end
end
