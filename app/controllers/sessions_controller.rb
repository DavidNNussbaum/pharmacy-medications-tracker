class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
  
    def new
      @user = User.new
    end
  
    def create
      user = User.find_by_password(params[:user][:password])
      if User && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user
      else
        redirect_to '/login', error: "Invalid credentials"
      end
    end
  
    def omniauth
      @user = User.from_omniauth(auth)
      if @manager.valid?
        session[:manager_id] = @userprojects.id
        redirect_to @manager
      else
        render :new
      end
    end
  
    def destroy
      session.clear
      redirect_to "/login"
    end
  
    private
  
    def auth
      request.env['omniauth.auth']
    end
  end