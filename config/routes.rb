Rails.application.routes.draw do
  root to: 'gmis#index'

  get 'home/index'
  get 'login',  to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  match 'vote_up/:id', to: 'votes#vote_up', via: %i[post put patch]

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  # Omniauth
  get '/auth/:provider/callback', to: 'sessions#create'

  resource :phone_verify_code, only: :create

  namespace :settings do
    resource :profile, only: %i[index update]
    resource :security, only: :index
  end

  get 'account', to: 'account#index'
  get 'account/:nothings', to: 'account#index'

  constraints subdomain: 'gmis' do
    root 'gmis#index', as: :gmis
    get ':year', to: 'gmis#show', constraints: { year: /2017/ }
  end

  namespace :admin do
    resources :users, only: :index
    resources :articles, except: %i[show new edit]
    resources :categories, only: :index
    resources :events, except: :show do
      scope module: 'events' do
        resources :guests, except: %i[show new edit]
        resources :partner_categories, except: %i[show new edit] do
          resources :partners, except: %i[show new edit]
        end
      end
    end
    resources :guests, except: :show
    resources :partners, except: :show
  end
end
