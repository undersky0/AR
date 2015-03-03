Rails.application.routes.draw do
  resources :images, except: [:new, :edit, :create, :destroy, :update]
end
