Rails.application.routes.draw do
  namespace :admin do
    root "static_page#home"
    resource :users
  end

  root "static_page#home"
  devise_for :users
  resource :users, only: [:index, :show]
end
