Rails.application.routes.draw do

  root 'pages#home'
  get 'signup', to: 'advisors#signup', as: 'signup'
  post 'signup', to: 'advisors#signup_action', as: 'signup_action'

end
