class StudentCoursesController < ApplicationController
  def create
    course_to_add = Course.find(params[:course_id])
    unless current_user.courses.include?(course_to_add)
      StudentCourse.create(course: course_to_add, student: current_user)
      flash[:notice] = "You have enrolled for #{course_to_add.name}"

      redirect_to student_path(current_user)
    else
      flash[:error] = "Something got wrong with your enrollment"
      redirect_to :root
    end
  end
end