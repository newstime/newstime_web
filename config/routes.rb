Newsstand::Application.routes.draw do

  devise_for :users
  root to: "pages#home"

  #devise_for :users

  namespace :newsstand do
  resources :editions
  end

  scope '/editions', controller: 'editions' do
    get '/' => :index, as: :editions
    get '/new' => :new, as: :new_edition

    #get '/:id' => :show, as: :edition
    get "/*path" => "editions#show", as: :edition

    post '/' => :create
  end

  scope '/store', controller: 'store_items' do
    get '/' => :index, as: :store_items
    get "/*path" => :show
  end

  scope ":publication_slug" do
    get ':edition_slug' => 'publications#show'
    get ':edition_slug/*path' => 'publications#browse'

    post ':edition_slug' => 'editions#create'
  end

  get ':slug/*path' => 'profiles#show'

  match "*a", :to => "application#routing_error", via: [:get, :post]

end
