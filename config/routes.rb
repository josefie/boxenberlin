Boxenberlin::Application.routes.draw do

  #get 'sessions/new' => 'sessions#new', as: :new_session

  resources :sessions, :only => [:new, :create, :destroy]
  
  resources :boxers, :except => :index

  resources :clubs

  resources :events, :except => :index

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'events#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  
  get 'calendar/(:date)' => 'events#index', defaults: {date: Date.today.to_s}, as: :calendar, 
  constraints: { date: /\d{4}-\d{2}-\d{2}/ }
  
  get 'dashboard/:id' => 'dashboard#index', as: :dashboard
  get 'dashboard/:id/profile' => 'dashboard#profile', as: :my_profile
  get 'dashboard/:id/events' => 'dashboard#events', as: :my_events
  get 'dashboard/:id/boxers' => 'dashboard#boxers', as: :my_boxers
  
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
