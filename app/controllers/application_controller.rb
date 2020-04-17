class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_wizard, :require_login, :admin_only

    def current_wizard
        if session[:wizard_id].present?
            wizard = Wizard.find_by(:id => session[:wizard_id])
        end
    end

    def require_login
        unless current_wizard
        redirect_to root_url
        end
    end

    def admin_only
        # unless current_wizard.admin
        #     flash[:notice] = "You must be an admin to perform that function."
        # end
        current_wizard.admin 
    end
end
