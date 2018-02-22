# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'projects', :to => 'projects#index'
get 'projects/:id/children', :to => 'projects#children'
