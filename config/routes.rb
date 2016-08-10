Rails.application.routes.draw do

  root 'pages#home'

  get 'signup', to: 'advisors#signup', as: 'signup'
  post 'signup', to: 'advisors#signup_action', as: 'signup_action'

  get 'new_profile', to: 'profiles#new_profile', as: 'new_profile'
  post 'new_profile', to: 'profiles#new_profile_action', as: "new_profile_action"

  get 'new_listing', to: 'listings#new_listing', as: "new_listing"
  post 'new_listing', to: 'listings#new_listing_action', as: "new_listing_action"

  get 'login', to: 'sessions#login', as: "login"
  post 'login', to: 'sessions#login_action', as: "login_action"
  get 'logout', to: 'sessions#logout', as: "logout"

end
