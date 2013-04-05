Spammer::Application.routes.draw do
  
  mount RedactorRails::Engine => '/redactor_rails'


  devise_for :users, controllers: { omniauth_callbacks: "sessions" }

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :users, :only => [:show] do
    collection do
      get 'home'
    end  
    member do
      get 'draft'
    end  
    resources :messages do
      collection do
        get 'search'
      end
    end   
    resources :contacts do
      collection do
        get 'search'
      end
    end  
    resources :subscribes , :only => [:show,:edit,:update]
  end

  resources :contact_us,:only=>[:new,:create]
    
  match 'auth/failure', to: redirect('/')

  match 'home' => 'users#home',:as => 'home'
  match 'contact_us' => 'contact_us#new',:as=>:contact_us
  match 'about' => 'pages#about', :as => :about
  match 'terms'=>'pages#terms',:as => :terms
  match 'privacy_policy'=>'pages#privacy_policy',:as => :privacy_policy
  match 'subscribe'=>'pages#subscribe',:as => :subscribe
  root :to => 'users#welcome'
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
