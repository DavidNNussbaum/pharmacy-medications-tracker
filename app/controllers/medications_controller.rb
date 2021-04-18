class MedicationsController < ApplicationController
    before_action :find_medication, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    

     def index
       @medications = Medication.order_by_name
       if params[:search]
        if @medications.include?(params[:search])
          @medications = Medication.search_by_name(params[:search]).order_by_name
        else
          flash[:danger] = 'This Medication Is Not In Our System'
        end
      else
        @medications = Medication.all
       end
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
            flash[:danger] = 'This Medication Is Already In Our System'
            render 'sessions/homepage'
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
    @medication = Medication.find(params[:id])
  end

  
    def medication_params
      params.require(:medication).permit(
        :name,
        :quantity_received,
        :search,
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
