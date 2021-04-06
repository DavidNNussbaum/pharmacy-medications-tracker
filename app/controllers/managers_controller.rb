class ManagersController < ApplicationController
    before_action :find_manager, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in

     def index
       @managers = Manager.all
     end

    def show
        find_manager
    end
  
    def new
      @manager
   
    end
  
    def edit
 
    end
  
    def create
      @manager = Manager.new(manager_params)
      if @user.id
        session[:manager_id] = @manager.id
        redirect_to @manager
             
      else  
        render :new
      end
    end
  
    def update
       
      if @manager.update(manager_params)
        redirect_to manager_path(@manager)
      else 
        render :edit
      end
      
    end


  def destroy
        if @manager.destroy
            redirect_to manager_path
        else
            redirect_to back
        end
  end
private

  def find_manager
    @manager = Manager.find(params[:id])
  end
  
    def manager_params
      params.require(:manager).permit!
    end
end
