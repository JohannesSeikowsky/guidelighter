Rails.application.routes.draw do

  root 'pages#home'

  # advisors related
  get 'signup', to: 'advisors#signup', as: 'signup'
  post 'signup', to: 'advisors#signup_action', as: 'signup_action'

  # profiles related
  get 'new_profile', to: 'profiles#new_profile', as: 'new_profile'
  post 'new_profile', to: 'profiles#new_profile_action', as: "new_profile_action"

  get 'edit_profile', to: 'profiles#edit', as: 'edit_profile'
  patch 'update_profile', to: 'profiles#update', as: 'update_profile'

  # listings related
  get 'listing/:listing_id', to: 'listings#show', as: 'show_listing'
  
  get 'new_listing', to: 'listings#new_listing', as: "new_listing"
  post 'new_listing', to: 'listings#new_listing_action', as: "new_listing_action"
  
  get 'edit_listing/:listing_id', to: 'listings#edit', as: 'edit_listing'
  patch 'update_listing/:listing_id', to: 'listings#update', as: 'update_listing'

  delete 'delete_listing/:listing_id', to: 'listings#destroy', as: 'delete_listing'

  # session related
  get 'login', to: 'sessions#login', as: "login"
  post 'login', to: 'sessions#login_action', as: "login_action"
  get 'logout', to: 'sessions#logout', as: 'logout'

end
