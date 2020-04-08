class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :location, :maximum_participants)
  end


end
