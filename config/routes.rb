Rails.application.routes.draw do

  # get 'deliveries/index'
  # get 'deliveries/create'
  # get 'deliveries/update'
  # get 'deliveries/destroy'
  # get 'deliveries/edit'
  devise_for :hosts, controllers: {
  sessions: 'hosts/sessions'}

  namespace :host do
    get 'top'=>'items#top'
    resources :items
    resources :genres
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :customers, controllers: {
    sessions: "customers/devise/sessions",
    passwords: "customers/devise/passwords",
    registrations: "customers/devise/registrations"
  }
  namespace :customers do

    resources :items, only: [:index, :show]
    resources :cart_items
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]

    get "/:id" => "customers#show"
    get "/:id/edit" => "customers#edit", as:"edit"
    patch "/:id" => "customers#update"
    get "/:id/withdraw_confirm" => "customers#withdraw_confirm", as:"withdraw_confirm"
  	patch "/:id/withdraw" => "customers#withdraw", as:"withdraw"

   end

end
