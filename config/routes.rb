Rails.application.routes.draw do
  
  resources :payments, except: :show
  get 'payments/:payment_date/payments_day', to: 'payments#payments_day', as: 'payments_day'
  get 'payments/:payment_id/operations_and_payments', to: 'payments#operations_and_payments',
                                as: 'operations_and_payments'

  get 'payments/add_wage/:payment_id/:operation_id', to: 'payments#add_wage', as: 'add_wage'

  get 'occupations/new'

  get 'occupations/create'

  get 'occupations/edit'

  get 'occupations/update'

  get 'occupations/delete'

  resources :orders, except: :show do
    resources :operations
  end

  get 'orders/search', to: 'orders#search', as: 'orders_search'

  resources :people, except: :show
  resources :occupations, except: :show

  devise_for :users

  root 'orders#index'

  get 'operations/in_hand'

  get '/orders/:order_id/operations/:id/additional', to: 'operations#additional', as: 'additional_operation'
  
  get '/orders/:order_id/operations/:id/split', to: 'operations#split', as: 'split_operation'

  get 'operations/:id/finished', to: 'operations#finished', as: 'finished_operation'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
