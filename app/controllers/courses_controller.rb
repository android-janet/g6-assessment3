class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    @student = Student.find_by_id(params[:student_id])
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @students = Student.all
  end

  def create
    @course = Course.new(course_params)
    @student = Student.find_by_id(params[:student_id])
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @instructors = Instructor.all
    @students = Student.all
    @course.students << @student
    @course.instructors << @instructor
    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
    @student = Student.find_by_id(params[:student_id])
    @instructor = Instructor.find_by_id(params[:instructor_id])
  end

private
def course_params
  params.require(:course).permit(:subject)
end


end
