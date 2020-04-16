class RegistrationsController < ApplicationController
    before_action :find_registration, only: [:edit, :update]

    def index
        @course = Course.find(params[:course_id])
        if params[:course_id]
            @registrations = Course.find_by(params[:course_id]).registrations
        else
            @registrations = Registration.all
        end
    end

    def new
        course = Course.find(params[:course_id])
        @registration = course.registrations.build
    end

    def create
        # if Registration.not_more_than_three
            # registration = Registration.create(registration_params)
        registration = current_wizard.registrations.build(registration_params)

        if registration.save
            # currently_enrolled += 1
            redirect_to wizard_path(registration.wizard)
        else
            render :new
        end
    end

    def edit
        @course = Course.find_by_id(params[:course_id])
    end

    def update
        @registration.update(registration_params)
        redirect_to wizard_path(@registration.wizard)
    end
  
    def destroy
        # @registration = current_wizard.registrations.find_by_id(params[:id])
        @registration = current_wizard.registrations.find_by_id(params[:id])
            if @registration
                @registration.destroy
                flash[:message] = "Registration Cancelled"
                redirect_to wizard_path(current_wizard)
            else
                redirect_to "/"
            end

        # binding.pry
        # @registration.destroy
        # # flash[:message] = "Registration Cancelled"
        # redirect_to wizard_path(@registration.wizard)
    end

    private

    def registration_params
        params.require(:registration).permit(:time_slot, :wizard_id, :course_id)
    end

    def find_registration
        @registration = Registration.find_by_id(params[:id])
    end

end
