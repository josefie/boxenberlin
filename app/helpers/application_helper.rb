module ApplicationHelper
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, "#", :onclick => "remove_element(this)", :class => "btn remove-element-btn delete")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to(name, "#",  :onclick => "add_elements(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => "btn")
  end
  
  def format_date(date)
    date.strftime('%d.%m.%Y')
  end
  
  def format_time(time)
    time.strftime('%H:%M')
  end
  
end
