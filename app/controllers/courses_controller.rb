class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @student = Student.find_by_id(params[:student_id])
    @course = Course.new
  end

  def create
    @student = Student.find_by_id(params[:student_id])
    @course = Course.new(course_params)
    @student.courses << @student
    if @course.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
    @student = Student.find_by_id(params[:student_id])
  end

private
def course_params
  params.require(:course).permit(:subject)
end


end
