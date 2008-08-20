ActionController::Routing::Routes.draw do |map|
  map.resources :contacts

  map.resources :personal_questions

  map.resources :cvs

  map.resources :attachments

  map.resources :feedback_items

  map.resources :educational_levels

  map.resources :required_degrees

  map.resources :job_application_statuses

  map.resources :job_application_states

  map.resources :job_postings

  map.resources :degrees

  map.resources :educational_institutions

  map.resources :educational_qualifications

  map.resources :education_concentrations

  map.resources :differentiator_answers

  map.resources :differentiator_questions

  map.resources :user_benefit_preferences

  map.resources :transactions

  map.resources :accounts

  map.resources :job_application_attachments

  map.resources :job_applications

  map.resources :job_application_status_types

  map.resources :workflows

  map.resources :roles

  map.resources :transitions

  map.resources :post_codes

  map.resources :towns

  map.resources :addresses

  map.resources :phone_number_types

  map.resources :phone_numbers

  map.resources :working_times

  map.resources :employment_types

  map.resources :job_titles

  map.resources :currencies

  map.resources :work_history_items

  map.resources :benefits

  map.resources :personal_qualities

  map.resources :metrics

  map.resources :administrative_divisions

  map.resources :countries

  map.resources :geo_positions

  map.resources :logins

  map.resources :users

  map.resources :industries

  map.resources :employers

  map.resources :countries

  map.resources :skills

  map.resources :traits
  
  map.resources :professionals

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "jobyssey"
  
  map.connect 'it-professionals/:action/:id', :controller => 'professionals'
  map.connect 'it-employers/:action/:id', :controller => 'employers'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
