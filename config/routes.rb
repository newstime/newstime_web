Newsstand::Application.routes.draw do

  devise_for :users

  root to: "pages#home"
  get 'newsrack' => "pages#newsrack"

  get 'downloads' => 'downloads#download'

  get 'news_organization_sign_up' => 'pages#news_organization_sign_up', as: 'news_organization_sign_up'

  resources :editions do
    member do
      put :purchase
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
