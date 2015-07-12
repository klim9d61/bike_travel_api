Rails.application.routes.draw do

  get 'admin', :to => "access#index"

  get 'access/index'

  # if you have api.example.com/subjects
  # namespace :api, path: '/', constraints: { subdomain: 'api'} do
  #   resources :widgets
  # end
  # OR
  # constraints subdomain: 'api' do
  #   namespace :api, path: '/' do
  #     resources :widgets, only: :index
  #     resources :travels, only: :index
  #   end
  # end

  # if you have example.com/api/v1/subjects
  namespace :api do
    namespace :v1 do

      # resources :subjects do
      #   member do
      #     get :delete
      #   end
      # end

      resources :travel_categories do
        resources :travels
      end

      resource :review_categories do
        resource :reviews
      end

      resource :guide_categories do
        resource :guides
      end

      resources :widgets, only: :index

      resource :users do
        member do
          post :attempt_login
          post :logout
          get :login
        end
      end
    end
  end

  # match '/widgets', to: 'widgets#index',  via: 'get'
  #
  # root 'widgets#index'

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
