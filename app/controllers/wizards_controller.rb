class WizardsController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :find_wizard, only: [:show, :edit, :update]
  # helper_method :params

  def index
    if params[:house] = "Gryffindor"
      @wizards = Wizard.griffindor
    elsif params[:house] = "Slytherin"
      @wizards = Wizard.slytherin
    elsif params[:house] = "Ravenclaw" 
      @wizards = Wizard.ravenclaw
    elsif params[:house] = "Hufflepuff"
      @wizards = Wizard.hufflepuff
    else
      @wizards = Wizard.all
    end
  end

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
  end

  def edit
  end

  def update
	  @wizard = Wizard.update(wizard_params)
	  redirect_to wizard_path(@wizard)
  end

  private
  def wizard_params
    params.require(:wizard).permit(:email, :password, :first_name, :last_name, :house, :admin, :uid)
  end

  def find_wizard
    @wizard = Wizard.find(params[:id])
  end
end
