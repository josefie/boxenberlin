#ruby encoding: utf-8
module ApplicationHelper
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, "#", :onclick => "remove_element(this)", :class => "btn remove-element-btn delete", :title => "Klicken um diesen Eintrag zu entfernen.")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to(name, "#",  :onclick => "add_elements(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => "btn", :title => "Klicken um einen weiteren Eintrag hinzuzufügen.")
  end
  
  def format_date(date)
    date.strftime('%d.%m.%Y')
  end
  
  def format_time(time)
    time.strftime('%H:%M')
  end
  
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end
  
  def add_fight(event, fight)
    fight.save
    event.fights << fight
    event.boxers.reject! { |p| p.id == (fight.opponent_red.id || fight.opponent_blue.id) }
  end
  
  def remove_fight(event, fight)
    event.boxers << fight.opponent_red
    event.boxers << fight.opponent_blue
    fight.destroy
  end
  
  def calendar_nav
    if controller?('events') && action?('index')
      return true
    end
    return false
  end
  
  def dashboard_nav
    if (current_user && (
      my_events_nav ||
      action?('my_boxers') ||
      action?('my_profile') ||
      action?('manage') ||
      action?('dashboard') ||
      (controller?('clubs') && action?('edit')) ||
      (controller?('boxers') && (action?('new') || action?('edit') || action?('create') || action?('update') || action?('destroy'))) ||
      (controller?('boxers') && action?('show') && @boxer.club_id == current_user.id )
      ))
      return true
    end
    return false
  end
  
  def my_events_nav
    if (current_user && (
      action?('my_events') || 
      controller?('events') && action?('new') ||
      controller?('events') && action?('create') ||
      controller?('events') && action?('edit') ||
      controller?('events') && action?('update') ||
      controller?('events') && action?('destroy') ||
      (controller?('events') && action?('show') && @event.club_id == current_user.id )
      ))
      return true
    end
    return false
  end
end
