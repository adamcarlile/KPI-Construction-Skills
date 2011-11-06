CmsEngine.override_page_type :homepage
class Homepage < Page

  self.can_have_children = false
  self.extra_path_params = [:month, :year]
  self.extra_admin_object_tabs_path = "#{page_type_package}/views/admin/extra_object_tabs"
  self.page_layout = 'homepage'
  
  has_many :panels, :as => :panelable
  
  def render(params)
    month = (params[:month] || (Time.zone || Time).now.month).to_i
    year = (params[:year] || (Time.zone || Time).now.year).to_i
    shown_month = Date.civil(year, month)
    end_date = shown_month + 1.month - 1.day
    {
      :month => month,
      :year => year,
      :shown_month => shown_month,
      :banners => Banner.all(:limit => 5),
      :callouts => page_callouts,
      :events => CourseEvent.in_date_range(shown_month...end_date)
    }
  end
  
end