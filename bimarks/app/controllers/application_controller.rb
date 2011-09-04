class ApplicationController < ActionController::Base
  protect_from_forgery
	include SessionsHelper
	include BookmarksHelper
	
	helper_method :admin?
	
	def admin?
	  signed_in? && current_user.is_admin
  end
	
end
