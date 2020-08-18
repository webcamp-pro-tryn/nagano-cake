Rails.application.routes.draw do

  devise_for :hosts, controllers: {
  sessions: 'hosts/sessions'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :customers, controllers: {
    sessions: "customers/devise/sessions",
    passwords: "customers/devise/passwords",
    registrations: "customers/devise/registrations"
  }
  namespace :customers do
    resources :items, only: [:index]
    resources :customers, only: [:show, :edit, :update, :destroy]
    get "/customers/:id/withdraw_confirm" => "customers#withdraw_confirm"
  	patch "/customers/:id/withdraw" => "customers#withdraw", as:"customers_withdraw"
  end

end
