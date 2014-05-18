Newsstand::Application.routes.draw do

  devise_for :users

  root to: "pages#home"

  scope ":publication_slug" do
    get ':edition_slug' => 'editions#show'
    get ':edition_slug/*path' => 'editions#browse'

    post ':edition_slug' => 'editions#create'
  end

  get 'account' => 'accounts#show'

  get "*path", :to => "pages#show"

end
