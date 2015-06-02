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
    # @student = Student.find_by_id(params[:student_id])
    # @instructor = Instructor.find_by_id(params[:instructor_id])
    # @instructors = Instructor.all
    # @students = Student.all
    # @course.students << @student
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

  def edit
    @course = Course.find(params[:id])
  end

  def update
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
  params.require(:course).permit(:subject)
end


end
