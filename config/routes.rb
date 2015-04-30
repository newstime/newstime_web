Newsstand::Application.routes.draw do

  constraints subdomain: "www" do

    devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" }
    devise_for :admins, :controllers => { :sessions => "sessions", :registrations => "registrations" }

    root to: "pages#home"

    get 'search'    => 'search#search' #, constraints: { :q => /.+/ }
    get 'newsrack'  => "pages#newsrack"
    get 'downloads' => 'downloads#download'
    get 'library' => 'libraries#show'
    get 'admin' => 'admin/pages#dashboard'

    namespace 'admin' do
      resources :users
    end

    get 'newsrack_sprite/:path' => 'newsracks#sprite'

    resources :news_organization_inquiries, only: [:new, :create] do
      collection do
        get :success
      end
    end

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
      get ':edition_slug/*path' => 'edition_browse#browse'

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

  constraints subdomain: "read" do

    scope ":publication_slug" do
      get ':edition_slug/*path' => 'edition_browse#browse'
    end

    get "/", :to => "edition_browse#www_redirect"
    get "*path", :to => "edition_browse#www_redirect"

  end

end
