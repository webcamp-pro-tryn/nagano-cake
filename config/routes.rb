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
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:new, :index, :create] do
      delete :destroy_all, on: :member
    end
  end
  delete 'customers/cart_items' => 'customers/cart_items#destroy_all',as:'destroy_all'
end
