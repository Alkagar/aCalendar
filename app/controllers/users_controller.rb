class UsersController < ApplicationController

    def login
        if !session[:current_user].nil?
            redirect_to(root_path)
        end
        if request.post?
            @user = User.authenticate(params[:user][:login], params[:user][:password])
            if @user.nil?
                flash.now[:error] = 'You need to log in!'
            else
                session[:current_user] = @user
                redirect_to(root_path)
            end
        end
        @user = User.new
    end

    # here show form 
    def new
        @user = User.new
    end

    # here add user to db
    def create
        @user = User.new params[:user]
        if @user.valid? :on => :create
            flash[:notice] = 'Account created, now you can login using your password.'
            redirect_to(login_users_path) if @user.save
        end
    end

    def logout
        session[:current_user] = nil
        redirect_to(root_path)
    end
end
