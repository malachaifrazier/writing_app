Rails.application.routes.draw do
  get 'home/index'
  get 'projects/archive'

  devise_for :users, controllers: { registrations: "registrations" }

  resources :projects, shallow: true do
    member do
        get :calendar
      end
    resources :goals do
      member do
        get :calendar
        get :list
      end
    end
    resources :entries
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get :settings
      get :profile
    end
  end

  root 'home#index'
end
