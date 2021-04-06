class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
  
    def new
      @manager = Manager.new
    end
  
    def create
      manager = Manager.find_by_password(params[:user][:password])
      if manager && manager.authenticate(params[:user][:password])
        session[:manager_id] = manager.id
        redirect_to manager
      else
        redirect_to '/login', error: "Invalid credentials"
      end
    end
  
    def omniauth
      @manager = Manager.from_omniauth(auth)
      if @manager.valid?
        session[:manager_id] = @manager.id
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