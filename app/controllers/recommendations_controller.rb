class RecommendationsController < ApplicationController
  def create
    patient = params[:patient_id]
    doctor = params[:doctor_id]
    Patient.find(patient).recommendations.create!(recommendation:params[:recommendation],doctor_id:doctor)
  end
end
