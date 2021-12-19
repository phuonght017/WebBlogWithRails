Rails.application.routes.draw do
  scope ':locale', locale: /#{I18n.available_locales.join("|")}/ do
    resources :users
    resources :posts do
      resources :comments
    end
    resources :sessions, only: [:new, :create, :destroy]
    get "signup", to: "users#new", as: "signup"
    get "login", to: "sessions#new", as: "login"
    post "login", to: "sessions#create"
    get "logout", to: "sessions#destroy", as: "logout"
    root 'posts#index'
    delete '/post/:id', to: "posts#destroy", as: 'delete_post'
  end
  post "login", to: "sessions#create"
  get '', to: redirect("/#{I18n.default_locale}")
end
