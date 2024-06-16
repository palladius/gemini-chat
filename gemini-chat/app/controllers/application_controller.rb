class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  #helper_method :current_user
  #helper_method :logged_in?

  # def current_user
  #   if session[:user_id]
  #     @current_user  = User.find(session[:user_id])
  #   end
  # end

  # def log_in(user)
  #   session[:user_id] = user.id
  #   @current_user = user
  #   redirect_to root_path
  # end

  def logged_in?
    # before devise
    #    !current_user.nil?
    user_signed_in?
  end

  # def log_out
  #   session.delete(:user_id)
  #   @current_user = nil
  # end

end
