class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:destroy]
  
    def new
      @user = User.new
      render :login
    end
    
    def create
      if params[:code] == TODAYS_CODE
        user = User.find_by_email(user_params[:email])
        if user && user.authenticate(user_params[:password])
          session[:user_id] = user.id
          redirect_to user
        else
          flash[:danger] = 'Invalid Credentials'
          redirect_to '/login' 
        end
      else
        flash[:danger] = 'Invalid Code'
        redirect_to '/login' 
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

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
    def auth
      request.env['omniauth.auth']
    end
  end