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
        if current_wizard.admin
            true
        else
            false
        end
        # flash[:notice] = "You must be an admin to perform that function!"
        # redirect_to wizard_path(current_wizard)
    end
end
