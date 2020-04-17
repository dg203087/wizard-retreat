class RegistrationsController < ApplicationController
    before_action :require_login
    before_action :find_registration, only: [:show, :edit, :destroy]

    def index
        @wizard = Wizard.find(params[:wizard_id])
        # @course = Course.find(params[:course_id])
        if params[:wizard_id]
            @registrations = Wizard.find_by(params[:wizard_id]).registrations
        else
            @registrations = Registration.all
        end
    end

    def new
        course = Course.find(params[:course_id])
        @registration = course.registrations.build
    end

    def create
        registration = current_wizard.registrations.build(registration_params)

        if registration.save
            # currently_enrolled += 1
            redirect_to wizard_path(registration.wizard)
        else
            render :new
        end
    end

    def show
        @wizard = Wizard.find_by_id(params[:wizard_id])
    end

    def edit
        @course = Course.find_by_id(params[:course_id])
    end

    def update
        binding.pry
        @registration.update(registration_params)
        redirect_to wizard_path(@registration.wizard)
        # redirect_to course_registrations_path(@wizard.course, @course.registrations)
    end
  
    def destroy
        @registration.destroy
        redirect_to wizard_path(@registration.wizard)
    end

    private

    def registration_params
        params.require(:registration).permit(:time_slot, :wizard_id, :course_id)
    end

    def find_registration
        @registration = Registration.find(params[:id])
    end

end
