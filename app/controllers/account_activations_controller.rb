class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])

    Rails.logger.debug "Params email: #{params[:id]}"
    Rails.logger.debug "User: #{user.inspect}"
    Rails.logger.debug "Activated? #{user.activated?}"
    Rails.logger.debug "Authenticated? #{user.authenticated?(:activation, params[:id])}"

    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      #user.activate
      Rails.logger.debug "Activation successful"
      Rails.logger.debug "Activated? #{user.activated?}"  # Add this line to check activation status


      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else

      Rails.logger.debug "Invalid activation link"

      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
