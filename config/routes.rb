Rails.application.routes.draw do

  get 'signup'  => 'users#new'
  resources :stories, :only => [:show] do
    resources :posts
  end

  resources :users do
    resources :stories
  end

   get 'login' => 'sessions#new'
   post 'login' => 'sessions#create'
   root 'stories#index'
   delete 'logout' => 'sessions#destroy'
end
