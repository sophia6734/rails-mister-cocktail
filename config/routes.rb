Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: %i[index new show create] do
    resources :doses, only: %i[show]
  end

  resources :doses, only: %i[destroy]
  get 'cocktails/:id', to: 'doses#new'
  post 'cocktails/:id', to: 'doses#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
