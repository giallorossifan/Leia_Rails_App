class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:email])
      # Log the user in and redirectr to the users's show page.
    else
      flash.now[:danger] = 'Invalid email/password combination' #not quite right!
    render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end

end
