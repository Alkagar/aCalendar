class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
      u = User.new
      u.name = "Jakub"
      u.hashed_password = "pharazon"
      u.login = "alkagar"
      u.email = "alkagar@gmail.com"
      u.save
      @user = u;
  end

  def create_account
  end

end
