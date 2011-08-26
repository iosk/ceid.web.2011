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

  # This function is pretty straight forward.
  # It puts a hidden field on item f. It also puts a link on item f.
  # When this link is activated:
  #     a) Sets true to the hidden field
  #     b) Activates (via link_to_function) another method:
  #           i) That is function remove_field found in public/javascript/application.js
  def link_to_remove_field(name, f)
    f.hidden_field(:_destroy) + link_to_function( name, "remove_field(this)" )
  end
  
  
  # This is kinda magic ;)
  # First we create a new instance of the current model defined by the association parameter.
  # Then we create new fields for that instance
  # And for each of these fields we render their form page.
  # Finally we give a link to an .jquery function found in public/javascript/application.js
  def link_to_add_field(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s + "_form", :f => builder)
    end
    link_to_function(name, ("add_field(this, '#{association}', '#{escape_javascript(fields)}')"))
  end



end



