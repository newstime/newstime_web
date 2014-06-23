Newsstand::Application.routes.draw do

  devise_for :users, :controllers => { :sessions => "sessions" }

  root to: "pages#home"

  get 'search'    => 'search#search' #, constraints: { :q => /.+/ }
  get 'newsrack'  => "pages#newsrack"
  get 'downloads' => 'downloads#download'
  get 'library' => 'libraries#show'

  get 'newsrack_sprite/:path' => 'newsracks#sprite'

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

  get 'account'         => 'accounts#show'
  get 'wallet'          => 'accounts#wallet'   ,       as: :account_wallet
  get 'purchases'       => 'accounts#purchases',       as: :account_purchases
  get 'subscriptions'   => 'accounts#subscriptions',   as: :account_subscriptions
  get 'change_password' => 'accounts#change_password', as: :account_change_password
  get 'update_info'     => 'accounts#update_info', as: :account_update_info


  get "*path", :to => "pages#show"

end
