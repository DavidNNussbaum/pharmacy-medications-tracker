class PharmaciesController < ApplicationController
    before_action :find_pharmacy, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in

     def index
       @pharmacies = Pharmacy.order('name')
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
        :name, :medication_id, :patient_id,
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
          ]
      )
  
    end
end
