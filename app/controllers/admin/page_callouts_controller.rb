class Admin::PageCalloutsController < Admin::BaseController
  setup_resource_controller
  
  require_role :admin
  
  belongs_to :page
  
  index.response do |wants|
    wants.html { 
      @callouts = Callout.all
      @active = parent_object.page_callouts(:include => :callouts)
      @available = Callout.visible
    }
  end
  
  destroy.response do |wants|
    wants.html { redirect_to edit_parent_object_path }
  end

  update.response do |wants|
    wants.html { redirect_to edit_parent_object_path }
  end
  
  create.response do |wants|
    wants.html { redirect_to edit_parent_object_path }
  end

  create.fails.response do |wants|
    wants.html do
      flash[:error] = "Failed to add callout"
      redirect_to edit_parent_object_path
    end
  end

  def sort
    params[:page_callout].each_with_index do |id, index|
      PageCallout.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true, :status => 200
  end
  
  private
  
    def edit_parent_object_path(extra_params = {})
      send("edit_admin_#{parent_type}_path", parent_object, extra_params) + '#Callouts'
    end    
  
end