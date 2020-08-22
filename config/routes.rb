Rails.application.routes.draw do

  namespace :host do
    get 'top'=>'items#top'
    resources :items
    resources :genres
    resources :customers,　only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :edit, :edit, :update]
  end
  devise_for :hosts,controllers: {
    registrations: 'hosts/registrations',
    sessions: "hosts/sessions",
     }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :customers, controllers: {
    sessions: "customers/devise/sessions",
    passwords: "customers/devise/passwords",
    registrations: "customers/devise/registrations"
  }

  namespace :customers do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :destroy, :update]
    resources :orders, only: [:index, :new, :show, :create] do
      collection do
        get :confirm
      end
    end
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
    get "/:id/withdraw_confirm" => "customers#withdraw_confirm", as:"withdraw_confirm"
  	patch "/:id/withdraw" => "customers#withdraw", as:"withdraw"

    delete "/destroy_all" => "cart_items#destroy_all",as:"destroy_all"

    
  end

  scope module: 'customers' do
    resources :customers do
      resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
      resources :orders, only: [:index, :show]
    end
  end
end
