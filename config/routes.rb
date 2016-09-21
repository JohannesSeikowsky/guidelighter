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
  get 'new_user_request', to: 'contact_messages#new_user_request', as: 'new_user_request'

  # password reset related
  get 'new_password_request', to: 'contact_messages#new_password_request', as: 'new_password_request'
  post 'pw_retrieval_email', to: 'contact_messages#pw_retrieval_email', as: 'pw_retrieval_email'
  
  get 'pw_reset/:pw_reset_identifier', to: 'advisors#pw_reset', as: 'pw_reset'


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

  
  #FILTERING
  get "find_listings/:search", to: "listingsfilter#find_listings", as: "find_listings"

  # ADMIN
  # overview
  get 'admin', to: "admin_actions#admin", as: 'admin'
  get 'listings_overview', to: "admin_actions#listings_overview", as: "listings_overview"

  # resources of an advisor
  get 'advisors_resources/:advisor_id', to: "admin_actions#advisors_resources", as: "advisors_resources"

  # admin edits
  get 'admin_edit_profile/:profile_id', to: "admin_actions#admin_edit_profile", as: "admin_edit_profile"
  patch 'admin_update_profile', to: "admin_actions#admin_update_profile", as: "admin_update_profile"

  get "admin_edit_listing/:listing_id", to: "admin_actions#admin_edit_listing", as: "admin_edit_listing"
  patch 'admin_update_listing/:listing_id', to: "admin_actions#admin_update_listing", as: "admin_update_listing"

  # admin deletes
  delete 'destroy_advisor/:advisor_id', to: "admin_actions#destroy_advisor", as: 'admin_destroy_advisor'

  # setting tags
  get "tagging", to: "admin_actions#tagging", as: "tagging"
  post "update_tags/:listing_id", to: "admin_actions#update_tags", as: "update_tags"
end



