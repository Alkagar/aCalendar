class UsersController < ApplicationController
  def login
  end


  # here show form 
  def new
      @user = User.new
  end

  # here add user to db
  def create
      @user = User.new params[:user]
      if @user.valid?
          redirect_to({:action => 'login'}) if @user.save
      end
  end

  def logout
  end
end
