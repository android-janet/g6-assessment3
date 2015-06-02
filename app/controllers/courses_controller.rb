class CoursesController < ApplicationController
  def index
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @courses = Course.all
  end

  def new
    @course = Course.new
    @students = Student.all
    @instructors = Instructor.all
  end

  def create
    @student = Student.find_by_id(params[:student_id])
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @course = Course.new(course_params)
    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
    @student = Student.find_by_id(params[:student_id])
    @students = Student.all
    @instructor = Instructor.find_by_id(params[:instructor_id])
  end

  def edit
    @course = Course.find(params[:id])
    @student = Student.find_by_id(params[:student_id])
    @instructor = Instructor.find_by_id(params[:instructor_id])
  end

  def update
    @student = Student.find_by_id(params[:student_id])
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
  end

private
def course_params
  params.require(:course).permit(:subject, :student_id, :instructor_id)
end


end
