module SessionsHelper

  # logs in the given user.

  def log_in(user)
    session[:user_id] = user.id
    # Guard againts session replay attacks.
    # See https://bit.ly/33UvKOw for more.
    session[:session_token] = user.session_token
  end

  # Remember a user in a persitent session
  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # return the user corresponding to the remember token cookie.
  def current_user
    if (user_id = session[:user_id])
      user = User.find_by(id: user_id)
      @current_user ||= user if session[:session_token] == user.session_token
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end


  # Return sture is the given user is the current user.
  def current_user?(user)
    user && user == current_user
  end

  # Returns true if the user is logged in, false otherwise
  def logged_in?
    !current_user.nil?
  end

  # Fogets a persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user
  def log_out
    forget(current_user)
    reset_session
    @current_user = nil
  end

  # Stores the URL trying to be accessed
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end



end
