class AppointmentsController < ApplicationController

  def new
    # we need @user in our `simple_form_for`
    @handyman = Handyman.find(params[:handyman_id])
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    # we need `user_id` to associate appointment with corresponding user
    @handyman = Handyman.find(params[:handyman_id])
    @appointment.user = current_user
    @appointment.handyman = @handyman
    @appointment.status = "Pending"
    if @appointment.save
      redirect_to my_profile_path
    else
      render :new
    end
  end

  def accept_appointment
    @appointment = Appointment.find(params[:id])
    @appointment.status = "Accepted"
    @appointment.save
    redirect_to my_profile_path
  end

  def reject_appointment
    @appointment = Appointment.find(params[:id])
    @appointment.status = "Rejected"
    @appointment.save
    redirect_to my_profile_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :description, :status, :skill)
  end
end
