Boxenberlin::Application.routes.draw do
  
  #resources :news
  get 'news' => 'news#homepage', as: :news_index

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout/:id' => 'sessions#destroy', as: :logout

  resources :clubs, :except => [:new, :edit] do
    resources :locations, :only => [:create, :update, :destroy]
  end

  get 'signup' => 'clubs#new'
  
  resources :events, :except => :index do
    resources :fights, :only => [:index, :create, :update, :destroy]
  end
  
  resources :boxers, :except => :index
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'news#homepage'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  
  get 'calendar/(:date)' => 'events#index', defaults: {date: Date.today.to_s}, as: :calendar, 
  constraints: { date: /\d{4}-\d{2}-\d{2}/ }
  
  get 'dashboard' => 'clubs#dashboard', as: :dashboard
  get 'profile' => 'clubs#my_profile', as: :my_profile
  get 'profile/edit' => 'clubs#edit', as: :edit_profile
  get 'events/(role/:role)' => 'events#my_events', as: :my_events
  get 'boxers' => 'boxers#my_boxers', as: :my_boxers
  get 'manage/(:status)' => 'events#manage', as: :manage
  
  get 'events/:id/apply' => 'events#apply', as: :application
  post 'events/:id/apply' => 'events#send_application', as: :send_application  
  get 'events/:id/participants' => 'events#participants', as: :participants
  delete 'events/:id/participants/:boxer_id' => 'events#undo_application', as: :undo_application
  
  
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
