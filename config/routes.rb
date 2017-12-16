Rails.application.routes.draw do

  namespace :backend do
    resources :skladniki
    resources :dania
    resources :kategorie

    root to: 'welcomes#home'
  end

  root to: 'frontend/welcomes#home'

  scope :frontend do
    root to: 'frontend/welcomes#home'
  end
end
