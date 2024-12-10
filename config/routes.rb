Rails.application.routes.draw do
  get 'groups/new'
  get 'groups/index'
  get 'groups/show'
  get 'groups/edit'
  get 'inquiries/new'
  get 'inquiries/thanks'
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :withdraw]
    patch 'users/:id/withdraw' => 'users#withdraw', as: "withdraw_user"
    resources :posts, only: [:index, :show, :destroy]
    resources :comments, only: [:index, :show, :destroy]
    resources :inquiries, only: [:index, :show, :update]
    resources :groups, only: [:index, :show, :destroy]
    resources :programs, except: :show
    resources :categories, except: :show
    get '/searches' => 'searches#search', as: "searches"
  end


  devise_for :users
  resources :users, only: [:edit, :update, :show]
  get '/mypage' => 'users#mypage', as: "mypage"
  patch 'users/:id/withdraw' => 'users#withdraw', as: "withdraw_user"
  resources :posts
  resources :comments, only: [:create, :destroy]
  resources :inquiries, only: [:new, :create]
  get 'inquiries/thanks' => 'inquiries#thanks', as: "thanks"
  resources :groups, except: :destroy

  root to: "homes#home"
  get '/about' => 'homes#about', as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
