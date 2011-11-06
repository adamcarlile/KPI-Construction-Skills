ActionController::Routing::Routes.draw do |map|
  
  map.namespace(:admin) do |admin|
    admin.resources :pages do |page|
      page.resources :course_events
      page.resources :panels, :collection => {:sort => :post}
      page.resources :page_callouts, :collection => {:sort => :post}
    end
    admin.resources :callouts, :collection => {:sort => :post}
  end
  
  map.with_options(:controller => 'public/course_events') do |m|
    m.show_course_event '*slug_path/event/:id', :action => 'show'
  end

end
