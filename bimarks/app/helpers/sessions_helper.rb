# In here we will write functions used in the View and the Controller
module SessionsHelper

	def log_in(user)
		cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		self.current_user = user
	end

	def log_out
		cookies.delete(:remember_token)
		self.current_user = nil
	end

# This function returns the current user.
	def current_user=(user)
	  @current_user = user
	end 
	
	def current_user?(user)
    	  user == current_user
  	end

	def current_user
	  @current_user ||= user_from_remember_token
  	end

	def signed_in?
	  !current_user.nil?
	end
	
	def is_admin?(user)
	    user.is_admin?
	end

# This methods are used to prevent bookmarks manipulation by non-signed in users.
	def authenticate
    		deny_access unless signed_in?
  	end
	
	def deny_access
		store_location
		redirect_to login_path, :notice => "Please sign in to access this page."
	end

  	def redirect_back_or(default)
    		redirect_to(session[:return_to] || default)
    		clear_return_to
  	end

  private

	def store_location
      		session[:return_to] = request.fullpath
    	end
	
	def clear_return_to
		session[:return_to] = nil
	end

	def user_from_remember_token
		User.authenticate_with_salt(*remember_token)
	end

	def remember_token
		cookies.signed[:remember_token] || [nil, nil]
	end
	

end
