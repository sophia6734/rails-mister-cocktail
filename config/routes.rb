Rails.application.routes.draw do
  get 'doses/new'
  get 'doses/create'
  get 'cocktails/new'
  get 'cocktails/index'
  get 'cocktails/show'
  root to: 'cocktails#index'
  resources :cocktails, only: %i[index new show create] do
    resources :doses, only: %i[new create show]
  end

  resources :doses, only: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
