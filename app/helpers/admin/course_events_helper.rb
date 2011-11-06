module Admin::CourseEventsHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year}, :class => 'ajax_calendar')
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.last_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>"    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event, day = args[:event], args[:day]
      html = link_to("#{display_event_time(event, day)} #{event.title}", edit_object_url(event.id), :class => "ajax_dialog_link", :target => "edit_event_dialog")
      html
    end
  end
  
  def display_event_time(event, day)
    time = event.start_at
    if !event.all_day and time.to_date == day
      t = I18n.localize(time, :format => "%l:%M%p")
      %(<span class="ec-event-time">#{t}</span>)
    else
      ""
    end
  end
  
end