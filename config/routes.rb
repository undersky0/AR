Rails.application.routes.draw do
  root 'images#index'
  resources :images, except: [:new, :edit, :create, :destroy, :update]
end
