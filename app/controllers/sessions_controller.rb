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

  def facebook
    @wizard = Wizard.find_or_create_by(UID: auth['UID']) do |w|
      w.email = auth['info']['email']
      w.first_name = auth['info']['first_name']
      w.last_name = auth['info']['last_name']
      w.password = SecureRandom.hex
    end

    # if @wizard.valid?
      session[:wizard_id] = @wizard.id
      redirect_to wizard_path(@wizard)#, notice: 'Signed in through Facebook'
    # else
    #   redirect_to '/'
    # end

  end


  def destroy
    session.delete :wizard_id
    redirect_to root_path
  end

  private 

  def auth
    request.env['omniauth.auth']
  end

end
