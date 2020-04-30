class StudentsController < ApplicationController
  before_action :get_student, only:[:show, :edit, :update]
  before_action :require_user, except:[:new, :create]
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(get_student_params)
    if @student.save
      flash[:notice] = "Sign up successful"
      redirect_to :root
    else
      flash[:error] = "Something went wrong"
      redirect_to :new_student
    end
  end

  def show
  end

  def edit
  end

  def update
    if @student.update(get_student_params)
      flash[:notice] = "Profile updated"
    else
      flash[:error] = "Something went wrong"
    end
    
    redirect_to edit_student_path(@student)

  end

  private

  def get_student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def get_student
    @student = Student.find(params[:id])
  end
end