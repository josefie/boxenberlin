module EventsHelper
  def current_date
    if controller?("events")
      if action?("index")
        date = @current_date
      elsif action?("show", "apply", "participants")
        date = @event.date
      end
    elsif controller?("fights")
      date = @event.date
    end
    date
  end
end
