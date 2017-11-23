module SessionsHelper
  # create_session method defined, user.id unique id for each user
  def create_session(user)
    session[:user_id] = user.id
  end

  # destroy_session method defined
  # user_id clears by setting to nil
  def destroy_session(user)
    session[:user_id] = nil
  end

  #current_user method defined
  #current_user finds signed in user from session and db
  def current_user
    User.find_by(id: session[:user_id])
  end

  # ends module
end
