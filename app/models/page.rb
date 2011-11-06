require_dependency File.join('vendor/plugins/cms-engine/app/models/page')
class Page < ActiveRecord::Base
  
  has_many :page_callouts, :as => :editable
  
  %w(can_have_children can_have_comments visitable allowed_child_types archive show_in_nav page_type_package admin_template public_template extra_path_params page_layout extra_admin_object_tabs_path nav_dropdown_partial).each do |method_name|
      Page.class_eval <<-EOS
        def self.#{method_name}=(value)
          meta_def :#{method_name} do
            value
          end
          meta_def :#{method_name}? do
            value
          end
        end
        def #{method_name}
          self.class.#{method_name}
        end
        def #{method_name}?
          self.class.#{method_name}
        end
     EOS
  end
  
  # Defaults for page type properties
  self.can_have_children   = true
  self.visitable           = true
  self.can_have_comments   = false
  self.allowed_child_types = [:basic_page,:folder,:news_index,:hyperlink,:redirect, :faq_index]
  self.archive             = false
  self.show_in_nav         = true
  self.extra_path_params   = []
  self.page_layout         = 'public'
  self.extra_admin_object_tabs_path = false
  self.nav_dropdown_partial = false
  
end