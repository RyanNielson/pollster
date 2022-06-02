Rails.application.routes.draw do
  resources :polls, param: :slug, only: %i[show new create] do
    resources :choices, only: [] do
      resources :votes, only: :create
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'polls#new'
end
