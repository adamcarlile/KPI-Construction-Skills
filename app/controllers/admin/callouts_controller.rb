class Admin::CalloutsController < Admin::BaseController
  
  setup_resource_controller
  
  def index
    @visible = Callout.visible
    @invisible = Callout.invisible
    @callouts = Callout.all
  end
  
  def sort
    params[:callout].each_with_index do |id, index|
      Callout.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true, :status => 200
  end
  
end
