Rails.application.routes.draw do
  root "home#index"
  devise_for :users, controllers: {
    # registrations: "users/registrations",
    # sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  # get "up" => "rails/health#show", as: :rails_health_check
end
