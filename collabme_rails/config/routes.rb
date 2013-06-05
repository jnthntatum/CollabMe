CollabmeRails::Application.routes.draw do

  get "profile/index"

  get "profile/show"

  get "search/findResearchers"
  get "search/findGroups"
  get "search/findProjects"
  get "search/search"
  get "researchers/addInterest"
  get "researchers/addSkill"
  get "researchers/removeInterest"
  get "researchers/removeSkill"

  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):

  resources :researchers do
    collection do
      get :login
      post :post_login
      get :logout  
    end
    
    member do
      get 'email'
      post 'email'
      get 'edit_profile_picture'
      post 'upload_picture'
      get 'chat_list'
    end

    resources :posts
    resources :requests
    resources :educations
    resource :projects
  end 

  resources :educations do
    collection do
      get :add_education
    end
  end

  resources :projects do
    resources :posts
    resources :requests
    member do
      post 'add_member'
    end
  end

  resources :groups do
    resources :requests
    member do
      post 'add_member'
    end
  end
  

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  #match 'profile/:user_id' => 'profile#show

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
