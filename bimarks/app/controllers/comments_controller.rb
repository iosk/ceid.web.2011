class CommentsController < ApplicationController

# before_filter :authenticate_user!, :only => [:destroy, :create, :edit]


# This method creates a rating
def create
	@bookmark = Bookmark.find(params[:bookmark_id])
	@comment = @bookmark.comments.build(params[:comment])
	@comment.user = current_user

	respond_to do |format|
	if @comment.save
		flash[:success] = "Thanks for the comment dawg!"
          	format.html { redirect_to(@bookmark) }
        else
		flash[:error] = "Something went awfully wrong and your comment was not submitted, please try again. fuck!"
         	format.html { redirect_to(@bookmark) }
        end #if ends
	end #do ends
	
end

# update a rating
def update
	
	@comment = current_user.comments.find(params[:id])
	@bookmark = Bookmark.find_by_id(@comment.bookmark.id)

	respond_to do |format|
		if @comment.update_attributes(params[:comment])
			flash[:success] = "You've edited your comment 'right."
        		format.html { redirect_to(@bookmark) }
		else
			flash[:error] = "Something went awfully wrong and your comment was not submitted, please try again"
			format.html { redirect_to(@bookmark) }
		end  
	end
end

# Destroys a rating
def destroy
	@comment = current_user.comments.find(params[:id])
	@bookmark = Bookmark.find(params[:bookmark_id])
    
	@comment.destroy
    
	respond_to do |format|
      		format.html { redirect_to @bookmark }
    	end
end

def authorized_user
      @bookmark = current_user.comments.find_by_id(params[:id])
      redirect_to root_path if @bookmark.nil?
end

end