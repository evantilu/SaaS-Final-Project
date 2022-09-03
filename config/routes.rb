Rails.application.routes.draw do
  get 'events/index', as: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'events#index'
  resources :events


  post 'membership/create', to: 'memberships#create', as: :join
  delete 'membership/destroy', to: 'memberships#destroy', as: :quit

  get 'g', to: 'groups#index', as: :groups
  get 'my_groups', to: 'users#my_groups', as: :my_groups
  get 'g/new', to: 'groups#new', as: :new_group
  get 'g/:id', to: 'groups#show', as: :group
  get 'g/:id/members', to: 'groups#members', as: :members
  patch 'g/:id', to: 'groups#update'
  delete 'g/:id', to: 'groups#destroy'
  post 'g', to: 'groups#create'
  post 'groupevents/new', to: 'groupevents#create'

  get 'groupevents/new', as: :group_event

  get 'send_notify', to: 'groups#send_notify', as: :send_notify
  
end