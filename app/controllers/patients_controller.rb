class PatientsController < ApplicationController
    before_action :find_patient, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in

     def index
       @patients = Patient.all.order(:last_name)
     end

    def show
         
    end
  
    def new
      @patient = Patient.new
   
    end
  
    def edit
 
    end
  
    def create
      @patient = Patient.new(patient_params)
      if @patient.save
            redirect_to @patient 
        else  
            render :new
        end
    end
  
    def update
      if @patient.update(patient_params)
        redirect_to patient_path(@patient)
      else 
        render :edit
      end
      
    end


  def destroy
        if @patient.destroy
            redirect_to patient_path
        else
            redirect_to back
        end
  end
private

  def find_patient
    @patient = Patient.find(params[:id])
  end
  
    def patient_params
      raw_params = params.require(:patient).permit(:first_name, :last_name, :dob, :address, :search )
      if raw_params[:dob]
        array = raw_params[:dob].split("/")
        raw_params[:dob] = [array[1], array[0], array[2]].join('-')
      end
      raw_params
    end
end
