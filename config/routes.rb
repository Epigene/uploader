Rails.application.routes.draw do
  root to: "uploads#index"

  resource 'login', path: "login", controller: 'login', only: [:new, :create, :destroy]

  resources :uploads, path: 'files', only: [:index, :new, :create, :show, :destroy]
  resource :report, path: 'report', controller: 'report', only: [:index]
end
