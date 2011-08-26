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
<<<<<<< HEAD
  
  
=======

  def link_to_remove_field(name, f)
    f.hidden_field(:_destroy) + link_to_function( name, "remove_field(this)" )
  end
    




>>>>>>> 663dfb8ea6669a30c56d6bfa78bf9fa7195682b0
end



