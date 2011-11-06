class Admin::CourseEventsController < Admin::BaseController
  setup_resource_controller
  
  belongs_to :page

  require_role [:admin, :editor, :publisher]
  
  index.response do |wants|
    wants.html do
      @month = (params[:month] || (Time.zone || Time).now.month).to_i
      @year = (params[:year] || (Time.zone || Time).now.year).to_i

      @shown_month = Date.civil(@year, @month)

      @repeated_events = []

      @event_strips = end_of_association_chain.event_strips_for_month(@shown_month)
    
    end
  end
  
  destroy.response do |wants|
    wants.html { redirect_to edit_parent_object_path }
  end

  update.response do |wants|
    wants.html do 
      redirect_to edit_parent_object_path
    end
  end
  
  create.response do |wants|
    wants.html do
      redirect_to edit_parent_object_path
    end
  end

  create.fails.response do |wants|
    wants.html do
      flash[:error] = 'Failed to add event'
      redirect_to edit_parent_object_path
    end
  end
  
  private
  
    def edit_parent_object_path(extra_params = {})
      send("edit_admin_#{parent_type}_path", parent_object, extra_params) + '#Events-tab'
    end
end
