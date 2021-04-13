class SessionsController < ApplicationController
    # before_action :redirect_if_not_logged_in, only: [:destroy]
  
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
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end
  
      session[:user_id] = @user.id
  
      redirect_to user
    end
  
    def omniauth
      @user = User.from_omniauth(auth)
      if @user.valid?
        session[:user_id] = @userprojects.id
        redirect_to @user
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

    # def auth
    #   request.env['omniauth.auth']
    # end

    # <% if session[:user_id] %>
    #   <h1><%= @user.name %></h1>
    #   <h2>Email: <%= @user.email %></h2>
    #   <h2>Facebook UID: <%= @user.uid %></h2>
    #   <img src="<%= @user.image %>">
    # <% else %>
    #   <%= link_to('Log in with Facebook!', '/auth/facebook') %>
    # <% end %> 

    # def omniauth
    #   @user = User.from_omniauth(request.env['omniauth.auth'])
    #   if @user.valid?
    #     session[:user_id] = user_id
    #     redirect_to user_path(user)
    #   else
    #     redirect_to :login
    #   end
    # end
# For the user: If you plan on adding more than one omniauth option at any point
# in the future, I’d recommend also adding a provider attribute because 
# Bob’s uid for Google might be the same as Sally’s uid for Facebook.
  end