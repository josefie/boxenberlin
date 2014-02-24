Boxenberlin::Application.routes.draw do
  
  get 'news' => 'news#homepage'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout/:id' => 'sessions#destroy', as: :logout
  get 'signup' => 'clubs#new', as: :signup

  resources :clubs, :except => [:edit, :new] do
    resources :locations, :only => [:create, :update, :destroy]
  end
  
  resources :events, :except => :index do
    member do
      post 'apply' => 'events#send_application'
      delete 'apply/:boxer_id' => 'events#undo_application', as: :undo_apply
      post 'fights' => 'events#fights'
      get 'fights/download' => 'events#download_fightlist'
    end
  end

  resources :fights, :only => :update
  
  resources :boxers, :except => :index
  
  get 'calendar/(:date)' => 'events#index', defaults: {date: Date.today.to_s}, as: :calendar, 
  constraints: { date: /\d{4}-\d{2}-\d{2}/ }
  get 'dashboard' => 'clubs#dashboard', as: :dashboard
  get 'profile' => 'clubs#my_profile', as: :my_profile
  get 'profile/edit' => 'clubs#edit', as: :edit_profile
  get 'events/(role/:role)' => 'events#my_events', defaults: {role: 'host'}, as: :my_events
  get 'boxers' => 'boxers#my_boxers', as: :my_boxers
  get 'manage/(:status)' => 'events#manage', defaults: {status: 'open'}, as: :manage

  root 'events#index'
  
end
