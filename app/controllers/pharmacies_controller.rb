class PharmaciesController < ApplicationController
    before_action :find_pharmacy, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in

     def index
        @pharmacies = Pharmacy.all.order(:name)
        if params[:search] 
          @pharmacies= Pharmacy.search_by_name(params[:search])
          if params[:search]
            if @pharmaciess.include?(params[:search])
              @pharmacies = Pharmacy.search_by_name(params[:search]).order_by_name
            else
              flash[:danger] = 'This Pharmacy Is Not In Our System'
            end
        else
          @pharmacies = Pharmacy.all
        end
        end
     end

    def show
         
    end
  
    def new
      @pharmacy = Pharmacy.new
   
    end
  
    def edit
 
    end
  
    def create
      @pharmacy = Pharmacy.new(pharmacy_params)
      @pharmacy.user = current_user
      if @pharmacy.save
            redirect_to @pharmacy 
        else  
            render :new
        end
    end
  
    def update
      if @pharmacy.update(pharmacy_params)
        redirect_to pharmacy_path(@pharmacy)
      else 
        render :edit
      end
      
    end


  def destroy
        if @pharmacy.destroy
            redirect_to pharmacy_path
        else
            redirect_to back
        end
  end
private

  def find_pharmacy
    @pharmacy = Pharmacy.find(params[:id])
  end
  
    def pharmacy_params
      params.require(:pharmacy).permit(
        :name, :medication_id, :patient_id, :search,
        medication_attributes: [
            :name,
            :quantity_dispensed,
            :quantity_received
          ],
          patient_attributes: [
            :first_name,
            :last_name,
            :dob,
            :address
          ],
          user_attributes: [
            :first_name,
            :last_name,
            :password_digest,
            :email,
            :uid
          ]
        )
  
    end
end
