Newsstand::Application.routes.draw do

  devise_for :users

  root to: "pages#home"

  scope ":publication_slug" do
    get ':edition_slug' => 'publications#show'
    get ':edition_slug/*path' => 'publications#browse'

    post ':edition_slug' => 'editions#create'
  end

  get ':slug/*path' => 'profiles#show'

  match "*a", :to => "application#routing_error", via: [:get, :post]

end
