Press::Application.routes.draw do

  root to: "pages#home"

  devise_for :users

  namespace :newsstand do
  resources :editions
  end

  scope '/editions', controller: 'editions' do
    get '/' => :index, as: :editions
    get '/new' => :new, as: :new_edition

    get '/:id' => :show, as: :edition
    #get "/*path" => "editions#show"

    post '/' => :create
  end

  #scope '/store', module: 'newsstand' do
    #get '/' => :index, as: :store
    #get "/*path" => "store_items#show"
  #end

  match "*a", :to => "application#routing_error", via: [:get, :post]

end
