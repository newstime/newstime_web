Newsstand::Application.routes.draw do

  devise_for :users, :controllers => { :sessions => "sessions" }

  root to: "pages#home"

  get 'search'    => 'search#search' #, constraints: { :q => /.+/ }
  get 'newsrack'  => "pages#newsrack"
  get 'downloads' => 'downloads#download'
  get 'wallet'    => 'wallets#show'
  get 'library' => 'libraries#show'

  get 'news_organization_sign_up' => 'pages#news_organization_sign_up', as: 'news_organization_sign_up'

  get "/organization" => "organizations#show"

  resources :editions do
    member do
      put :purchase
      get :checkout
    end
  end

  resources :publications do
    member do
      put :subscribe
    end
  end

  scope ":publication_slug" do
    get ':edition_slug' => 'editions#show'
    get ':edition_slug/*path' => 'editions#browse'

    post ':edition_slug' => 'editions#create'
  end

  get 'account' => 'accounts#show'

  get "*path", :to => "pages#show"

end
