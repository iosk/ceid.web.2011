module BookmarksHelper

private
	def sort_column
    (Bookmark.column_names.include?(params[:sort]) || ["owner", "avg_rating"].include?(params[:sort]) )? params[:sort] : "title"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
    def tag_exists?(tagname)
    tag = Tag.find_by_name(tagname).nil? 
    tag ? false : tag
  end
end
