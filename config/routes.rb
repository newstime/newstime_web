Newsstand::Application.routes.draw do

  devise_for :users

  root to: "pages#home"

  get 'downloads' => 'downloads#download'

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
