class Public::CourseEventsController < Public::BaseController
  
  def show
    load_cms_dependent_parts
    load_event
    @extra_crumb = "#{@event.title} - #{@event.start_date.to_s(:short)}"
    add_page_breadcrumbs
  end
  
  private
  
    def load_event
      @event = @page.course_events.find(params[:id])
    end
  
    def load_cms_dependent_parts
      load_page
      load_shared_pages
      set_meta_data
    end
    
    
end
