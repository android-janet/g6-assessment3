class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @course = Course.find_by_id(params[:course_id])
    @instructor = Instructor.new(instructor_params)
    @instructor.id  
    if @instructor.save
      redirect_to instructor_path(@instructor)
    else
      render :new
    end
  end

  def show
    @course = Course.find_by_id(params[:course_id])
    @instructor = Instructor.find(params[:id])
  end

  def edit
    @course = Course.find_by_id(params[:course_id])
    @instructor = Instructor.find(params[:id])
  end

  def update
    @course = Course.find_by_id(params[:course_id])
    @instructor = Instructor.find(params[:id])
    @instructor.id
    if @instructor.update(instructor_params)
      redirect_to instructor_path(@instructor)
    else
      render :edit
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
  end

  private
  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name)
  end

end
