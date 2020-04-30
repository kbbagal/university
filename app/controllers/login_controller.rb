class LoginController < ApplicationController
  def new
  end

  def create
    student = Student.find_by(email: params[:email])
    if student && student.authenticate(params[:password])
      session[:student_id] = student.id
      flash[:notice] = "You are signed in"
    else
      flash[:error] = "Invalid email or password"
    end
    redirect_to :root
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "You are signed out"
    redirect_to :root
  end

  private

  def get_credentials
    params.require(:student).permit(:email, :password)
  end
end
