Rails.application.routes.draw do
  root to: "customers#index"
  resources :customers do
    member do
      get "versions", to: "customers#versions"
      get "version/:version_id", to: "customers#version", as: "version"
      post "revert/:version_id", to: "customers#revert", as: "revert"
      post "restore", to: "customers#restore", as: "restore"
    end
    collection do
      get "deleted", to: "customers#deleted"
    end
  end
end
