Rails.application.routes.draw do

  devise_for :customers, controllers: {
    sessions: "customers/devise/sessions",
    passwords: "customers/devise/passwords",
    registrations: "customers/devise/registrations"
  }
  namespace :customers do
    resources :items, only: [:index]
    resources :customers, only: [:show, :edit, :update, :destroy]
  end

end
