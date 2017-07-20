Rails.application.routes.draw do
   devise_for :user, controllers: {
     passwords: 'users/passwords',
     registrations: 'users/registrations',
     sessions: 'users/sessions'
 }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root "welcomes#index"

  namespace :admin do
     resources :products do
       member do
         patch :move_up
         patch :move_down
         post  :publish
         post  :hide
       end
     end
     resources :orders do
       member do
         post :cancel
         post :ship
         post :shipped
         post :return
       end
     end
     resources :categories
  end

  namespace :account do
    resources :orders
    resources :users
  end


  resources :products do
    collection do
      get :search
    end
    member do
      post :add_to_cart
      post :favorite
      post :unfavorite
      post :instant_buy
    end
    resources :reviews
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items do
    member do
      post :add_quantity
      post :remove_quantity
    end
  end
  resources :favorites

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end


end
