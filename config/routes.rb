Rails.application.routes.draw do
  devise_for :customers
  devise_for :hosts,controllers: {
    registrations: 'hosts/registrations',
    sessions: "hosts/sessions",
     }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
