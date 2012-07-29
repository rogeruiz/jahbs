LolcommitServer::Application.routes.draw do
  resources :git_commits
  resources :animated_gifs, :only => :create
  resources :repos

  match '/auth/:provider/callback', :to => 'sessions#create', :as => 'auth_callback'
  match '/auth/github', :as => 'auth_github'
  resource :sessions, :only => [:destroy]
  resource :users, :only => [] do
    get 'account'
  end
  resources :users, :only => :show


  root :to => "main#index"
end
