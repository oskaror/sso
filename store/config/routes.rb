Rails.application.routes.draw do
  root 'dashboard#index'

  resource :session, only: [:create, :destroy]
end
