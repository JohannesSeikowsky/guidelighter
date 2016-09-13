Rails.application.routes.draw do

  # root
  root 'pages#home'

  # statics
  get 'about', to: 'pages#about', as: 'about'
  get 'how', to: 'pages#how', as: 'how'
  get 'reviews', to: 'pages#reviews', as: 'reviews'

  # contact message
  get 'contact', to: 'contact_messages#new', as: 'contact'
  post 'contact', to: 'contact_messages#create', as: 'create_contact'

  # listing message
  post 'listing_message', to: 'listing_messages#create', as: 'create_listing_message'

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

  # requests related
  get 'request/:listing_id', to: "requests#new_request", as: 'new_request'
  post 'request/:listing_id', to: 'requests#create_request', as: 'create_request'
  get 'request_successful', to: 'requests#successful_request', as: 'successful_request'

  # sessions related
  get 'login', to: 'sessions#login', as: "login"
  post 'login', to: 'sessions#login_action', as: "login_action"
  get 'logout', to: 'sessions#logout', as: 'logout'

  # admin
  get 'admin', to: "admin_actions#advisors_mgmt", as: 'admin_general'
  get 'advisors_mgmt', to: "admin_actions#advisors_mgmt", as: 'advisors_mgmt'
  get 'profiles_mgmt', to: "admin_actions#profiles_mgmt", as: 'profiles_mgmt'
  get 'listings_mgmt', to: "admin_actions#listings_mgmt", as: 'listings_mgmt'
  delete 'destroy_advisor/:advisor_id', to: "admin_actions#destroy_advisor", as: 'admin_destroy_advisor'
end



