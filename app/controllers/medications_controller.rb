class MedicationsController < ApplicationController
    before_action :find_medication, only: [:show, :edit, :update, :destroy, :quantity_received_current]
    before_action :redirect_if_not_logged_in
    

     def index
      @pharmacy = Pharmacy.find_by(id: params[:pharmacy_id])
      if @pharmacy
        @medications = Medication.where(pharmacy: @pharmacy).order_by_name
      else
        @medications = Medication.all
      end
      if params[:search]
        @medications = @medications.search_by_name(params[:search]).order_by_name
      end
      @medications = @medications.distinct
     end
  
    def new
      @medication = Medication.new
      @pharmacy = Pharmacy.find_by(id: params[:pharmacy_id])

    end
  
    def show
      find_medication
    end
  
    def edit
 
    end
  
    def create
      @medication = Medication.new(medication_params)
      if @medication.save
          redirect_to pharmacy_medications_path(@medication.pharmacy)
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
            redirect_to medications_path
        else
            redirect_to back
        end
  end

  def quantity_received_current
     sum = @medication.quantity_received + params[:quantity_received].to_i
     @medication.update(quantity_received: sum)
     redirect_to @medication
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
        :pharmacy_id
      )
  
    end
end
