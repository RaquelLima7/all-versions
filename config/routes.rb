Rails.application.routes.draw do
  root to: "customers#index"
  resources :customers do
    member do
      get "versions", to: "customers#versions"
    end
  end
end
