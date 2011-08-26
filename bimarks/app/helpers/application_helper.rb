module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "biMarks 2011"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end


  def link_to_remove_field(name, f)
    f.hidden_field(:_destroy) + link_to_function( name, "remove_field(this)" )
  end
    
  def link_to_add_field(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s + "_form", :f => builder)
    end
    link_to_function(name, ("add_field(this, '#{association}', '#{escape_javascript(fields)}')"))
  end




end



