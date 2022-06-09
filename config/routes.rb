Rails.application.routes.draw do
  resources :polls, param: :slug, only: %i[show new create] do
    resources :choices, only: [] do
      resources :votes, only: :create
    end
    resources :results, only: :index
  end

  root 'polls#new'
end
