class PrescriptionsController < ApplicationController
    before_action :find_prescription, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    

     def index
       @prescriptions = Pharmacy.all
     end

    def show
         
    end
  
    def new
      @prescription = Prescription.new
      @prescription.build_medication
      @prescription.build_patient
      @prescription.build_pharmacy
    end
  
    def edit
 
    end
  
    def create
      @prescription = Prescription.new(prescription_params)
      if @prescription.save
            redirect_to @prescription
        else  
            render :new
        end
    end
  
    def update
      if @prescription.update(prescription_params)
        redirect_to prescription_path(@prescription)
      else 
        render :edit
      end
      
    end


  def destroy
        if @prescription.destroy
            redirect_to prescription_path
        else
            redirect_to back
        end
  end
private

  def find_prescription
    @prescription = Prescription.find(params[:id])
  end
  
    def prescription_params
      params.require(:prescription).permit(
        :name, :medication_id, :patient_id, :dispensed, :search,
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
          pharmacy_attributes: [
            :name,
            :address,
            :user_id
          ]
        )
    end
end
