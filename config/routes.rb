POACC::Application.routes.draw do
  # resources :appointments

  get "orthpaedics/index"
  
  get "appointments/index"
  get "appointments/new_patient"
  get "appointments/old_patient"
  get "appointments/booked"
  get "appointments/not_booked"

  post "appointments/createold"

  post "appointments/create"

  get "patients/old"

  get "practices/index"

  get "staffs/index"

  resources :followups

  resources :assessments

  resources :patients

  resources :appointments

  # resources :staffs

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  get "admin/index"
  # resources :practices

  resources :contact 


  get "home/index"
  get "home/about"
  get "home/contact"
  get "home/staffservice"
  get "home/woundcare"
  get "home/patients"
  get "home/trauma"
  get "home/bonehealth"
  get "home/bonehealthdetail"
  get "home/charityprojects"
  get "home/fellowships"
  get "home/jobs"
  get "home/ourlinks"
  # get "home/faqs"
  get "home/densitometryfellowship"
  get "home/bdcourse"
  get "home/trainingcurriculum"
  get "home/cosmotology"
  get "home/correctingtoes"
  get "home/heightincrease"
  get "home/faq"
  root "home#index"

  
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
