class Admin::PanelsController < Admin::BaseController
  setup_resource_controller
  
  belongs_to :page

  require_role [:admin, :editor, :publisher]
  
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
      flash[:error] = 'Failed to add panel'
      redirect_to edit_parent_object_path
    end
  end

  def sort
    params[:panel].each_with_index do |id, index|
      Panel.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true, :status => 200
  end
  
  private
  
    def edit_parent_object_path(extra_params = {})
      send("edit_admin_#{parent_type}_path", parent_object, extra_params) + '#Panels-tab'
    end    
    
end
