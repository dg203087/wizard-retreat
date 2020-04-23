class WizardsController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :this_wizard_only, only: [:show, :edit, :update, :destroy]
  before_action :find_wizard, only: [:show, :edit, :destroy]

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
    if @wizard.save
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
	  redirect_to wizard_path(current_wizard)
  end

  def destroy
    @wizard.destroy
    redirect_to root_path
  end

  private
  def wizard_params
    params.require(:wizard).permit(:email, :password, :password_confirmation, :first_name, :last_name, :house, :admin, :uid)
  end

  def find_wizard
    @wizard = Wizard.find(params[:id])
  end

  def this_wizard_only
    if find_wizard != current_wizard
        redirect_to wizard_path(current_wizard)
    end
  end
  
end
