class SessionsController < ApplicationController
  def new
    #@wizard = Wizard.new #whyyy?
  end

  def create
    @wizard = Wizard.find_by(email: params[:email])
    if @wizard && @wizard.authenticate(params[:password])
      session[:wizard_id] = @wizard.id
      redirect_to wizard_path(@wizard)
    else
      flash[:alert] = "Incorrect Sign In"
      render :new
    end
  end

  def destroy
    session.delete :wizard_id
    redirect_to root_path
  end

end
