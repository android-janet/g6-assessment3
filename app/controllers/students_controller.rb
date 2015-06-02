class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    @courses = Course.all
  end

  def create
    @course = Course.find_by_id(params[:course_id])
    @student = Student.new(student_params)
    @student.courses << @course
    if @student.save
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def show
    @course = Course.find_by_id(params[:course_id])
    @student = Student.find(params[:id])
  end

  def edit
    @course = Course.find_by_id(params[:course_id])
    @student = Student.find(params[:id])
  end

  def update
    @course = Course.find_by_id(params[:course_id])
    @student = Student.find(params[:id])
    @student.courses << @course
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
