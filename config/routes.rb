Rails.application.routes.draw do

  get 'signup'  => 'users#new'
  resources :users

   get 'login' => 'sessions#new'
   post 'login' => 'sessions#create'
   root 'sessions#new'
   delete 'logout' => 'sessions#destroy'

end
