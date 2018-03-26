Rails.application.routes.draw do
  devise_for :admins
  match "buttons" => "conf#index", :via => :get
  root to: 'visitors#index'
  get "/confs/show" => "confs#show", :as => 'another_new'
  get "/confs/2/shows"=> "confs#shows"
  get "/confs/admin_show"=> "confs#admin_show"
  get '/confs/button', to: 'confs#button', as: 'button'
  devise_for :users
  devise_scope :users do
  resources :confs
end
  resources :users
end
