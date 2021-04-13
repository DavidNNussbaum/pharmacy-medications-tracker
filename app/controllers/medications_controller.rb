class MedicationsController < ApplicationController
    before_action :find_medication, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    

     def index
       @medications = Medication.order_by_name
     end
  
    def new
      @medication = Medication.new
       
    end
  
    def show
      find_medication
    end
  
    def edit
 
    end
  
    def create
      @medication = Medication.new(medication_params)
      if @medication.save
            redirect_to @medication
        else  
            render :links
        end
    end
  
    def update
      if @medication.update(medication_params)
        redirect_to :links
      else 
        render :edit
      end
      
    end


  def destroy
        if @medication.destroy
            redirect_to medication_path
        else
            redirect_to back
        end
  end
private

  def find_medication
    # @medication = Medication.find(params[:id])
    @medication = Medication.find_by(params[:name])
  end

  
    def medication_params
      params.require(:medication).permit(
        :name,
        :quantity,
        patient_attributes: [
          :first_name,
          :last_name,
          :dob,
          :address
        ],
        pharmacy_attributes: [
          :name,
          :address
        ]
      )
  
    end
end
