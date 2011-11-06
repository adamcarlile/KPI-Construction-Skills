class CourseCategory < Page
  
  self.page_type_package   = 'courses'
  self.admin_template      = 'basic_page/views/admin/basic_page'
  self.allowed_child_types = [:course, :course_category]
  
end