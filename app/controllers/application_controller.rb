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
        redirect_to root_path
        end
    end


    def admin_only
        current_wizard.admin 
    end
end
