class ApplicationController < ActionController::Base
  before_action :setup_auth 

  def setup_auth 
    @user_id = session[:user_id]
    @logged_in = !!@user_id 
    if @logged_in 
      @current_user = User.find(@user_id)
    end 
  end
  
  def authorized 
    unless @logged_in
      flash[:message] = "Don't be a creep! Log in!"
      return redirect_to login_path 
    end 
  end 
  
  
end