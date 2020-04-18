class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  
  def index
    @courses = Course.all
  end

  def new
    if admin_only
      @course = Course.new
    else
      redirect_to courses_path
    end
  end

  def create
    @course = Course.new(course_params)
		@course.save
		redirect_to course_path(@course)
  end

  def show
  end

  def edit
    if admin_only
      find_course
    else
      redirect_to course_path(@course)
    end
  end

  def update
	  @course.update(course_params)
	  redirect_to course_path(@course)
  end

  def destroy
    if admin_only
      @course.destroy
    end
      redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :location, :maximum_participants)
  end

  def find_course
    @course = Course.find(params[:id])
  end

end
