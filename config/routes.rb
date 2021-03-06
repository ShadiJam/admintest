Rails.application.routes.draw do

  resources :charges, only: [:new, :create]

  get 'thanks', to: 'charges#thanks', as: 'thanks'

  resources :categories
  resources :lessons
  resources :videos
  resources :blogs

  devise_for :users, controllers: { registrations: "registrations" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
