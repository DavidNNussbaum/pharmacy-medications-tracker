class MedicationsController < ApplicationController
    before_action :find_medication, only: [:show, :edit, :update, :destroy]

     def index
       @medications = Medication.all.order('name')
     end

    def show
         
    end
  
    def new
      @medication = Medication.new
   
    end
  
    def edit
 
    end
  
    def create
      @medication = Medication.new(party_params)
      if @medication.save
            redirect_to @medication
        else  
            render :new
        end
    end
  
    def update
      if @medication.update(medication_params)
        redirect_to medication_path(@medication)
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
      params.require(:medication).permit!
    end
end
