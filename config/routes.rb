Boxenberlin::Application.routes.draw do
  
  #resources :news
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
      #get 'fights' => 'events#fights'
      post 'fights' => 'events#fights'
    end
  end

  resources :boxers, :except => :index
  
  root 'news#homepage'
  
  get 'calendar/(:date)' => 'events#index', defaults: {date: Date.today.to_s}, as: :calendar, 
  constraints: { date: /\d{4}-\d{2}-\d{2}/ }
  get 'dashboard' => 'clubs#dashboard', as: :dashboard
  get 'profile' => 'clubs#my_profile', as: :my_profile
  get 'profile/edit' => 'clubs#edit', as: :edit_profile
  get 'events/(role/:role)' => 'events#my_events', defaults: {role: 'host'}, as: :my_events
  get 'boxers' => 'boxers#my_boxers', as: :my_boxers
  get 'manage/(:status)' => 'events#manage', defaults: {status: 'open'}, as: :manage

  #get 'profile' => 'clubs#my_profile', as: :my_profile
  #get 'profile/edit' => 'clubs#edit', as: :edit_profile
  #get 'events/(role/:role)' => 'events#my_events', as: :my_events
  #get 'boxers' => 'boxers#my_boxers', as: :my_boxers
  #get 'manage/(:status)' => 'events#manage', as: :manage
  
  
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
