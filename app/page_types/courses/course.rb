class Course < Page
  has_many :course_events
  
  self.admin_template      = 'basic_page/views/admin/basic_page'
  self.page_type_package   = 'courses'
  self.extra_admin_object_tabs_path = "#{page_type_package}/views/admin/extra_object_tabs"
  
  def render(params)
    {
      :events => course_events.from_today.paginate(:page => params[:page])
    }
  end
  
end