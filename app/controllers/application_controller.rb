class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?#, :require_user

  def current_user
    @current_user = Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must sign in to perform that action"
      redirect_to :login
    end
  end
end
