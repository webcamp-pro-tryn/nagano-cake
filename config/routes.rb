Rails.application.routes.draw do
<<<<<<< HEAD
=======
  devise_for :customers, controllers: {
    sessions: "customers/devise/sessions",
    passwords: "customers/devise/passwords",
    registrations: "customers/devise/registrations"
  }
  namespace :customers do
    resources :items, only: [:index]
  end
>>>>>>> origin
end
