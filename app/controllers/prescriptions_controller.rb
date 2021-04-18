class PrescriptionsController < ApplicationController
    before_action :find_prescription, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    

     def index
       @prescriptions = Prescription.all
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
            redirect_to prescriptions_path
        else
            redirect_to back
        end
  end
private

  def find_prescription
    @prescription = Prescription.find(params[:id])
  end
  
    def prescription_params
      raw_params = params.require(:prescription).permit(
        :name, :medication_id, :patient_id, :quantity_dispensed, :search, :pharmacy_id, :dispensed,
          medication_attributes: [
            :name,
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
        if raw_params[:patient_attributes] && raw_params[:patient_attributes][:dob]&.present?
          array = raw_params[:patient_attributes][:dob].split("/")
          raw_params[:patient_attributes][:dob] = [array[1], array[0], array[2]].join('-')
        end
        raw_params
    end
end
