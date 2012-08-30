class UsersController < ApplicationController
  def login
  end


  # here show form 
  def new
      @user = User.new
  end

  # here add user to db
  def create
      @user = User.create params[:user]
      @user.save
  end

  def logout
  end
end
