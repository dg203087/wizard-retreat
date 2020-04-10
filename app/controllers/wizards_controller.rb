class WizardsController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @wizard = Wizard.new
  end

  def create
    @wizard = Wizard.create(wizard_params)
    if @wizard.valid?
      session[:wizard_id] = @wizard.id
      redirect_to wizard_path(@wizard)
    else
      render :new
    end
  end

  def show
    @wizard = Wizard.find_by(:id => params[:id])
  end

  private
  def wizard_params
    params.require(:wizard).permit(:email, :password, :first_name, :last_name, :house, :admin)
  end
end
