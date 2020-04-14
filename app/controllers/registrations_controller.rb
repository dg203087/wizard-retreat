class RegistrationsController < ApplicationController

    def create
        registration = Registration.create(wizard_id: current_wizard.id, course_id: params[:course_id])
        
        if registration 
            # registration.register
            # add You're all registered!
            # currently_enrolled += 1
            redirect_to wizard_path(registration.wizard)
        else
            # add Sorry class full/Sorry time slot full
            redirect_to course_path(registration.course)
        end
    end
    
    private

    def registration_params
        params.require(:registration).permit(:wizard_id, :course_id)
    end

end


