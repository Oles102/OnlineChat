Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :messages, only: :create do
    member { post :like }
  end
  resources :rooms, only: %i[show create], param: :title
  resources :users, only: :show, as: :account
   root "rooms#index"
end
