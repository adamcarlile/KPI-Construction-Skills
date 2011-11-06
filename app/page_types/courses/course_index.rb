class CourseIndex < Page
  
  self.page_type_package    = 'courses'
  self.admin_template       = 'basic_page/views/admin/basic_page'
  self.allowed_child_types  = [:course_category]
  self.nav_dropdown_partial = 'courses/views/public/navigation'
  
end