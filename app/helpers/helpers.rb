require "pry"
class Helpers 

  def current_user(hash)
    binding.pry
    @user = User.find(session[:user_id])
    # erb :'/users/home'
  end

  def is_logged_in?

  end

end