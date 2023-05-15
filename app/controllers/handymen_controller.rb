class HandymenController < ApplicationController

  def index
    # the `geocoded` scope filters only handymans with coordinates (latitude & longitude)
    if params[:search].present?
      @handyman = Handyman.global_search(params[:search][:query])
    else
      # Hacemos un reject para sacar al Handyman.id y liste solo los Handyman del resto
      @handyman = Handyman.where.not(user_id: current_user.id)
    end
    @markers = @handyman.geocoded.map do |handyman|
      {
        lat: handyman.latitude,
        lng: handyman.longitude,
        info_window: render_to_string(partial: "info_window", locals: { handyman: handyman }),
        image_url: helpers.asset_url("wrench.png")
      }
    end
  end

  def new
    # we need @user in our `simple_form_for`
    @handyman = Handyman.new
  end

  def show
    @handyman = Handyman.find(params[:id])
    @reviews_handyman = @handyman.reviews.filter do |r|
      r.author != current_user.email
    end
    @marker = [{
      lat: @handyman.latitude,
      lng: @handyman.longitude,
      info_window: render_to_string(partial: "info_window", locals: { handyman: @handyman }),
      image_url: helpers.asset_url("wrench.png")
    }]
    @appointment = Appointment.new
  end

  def create
    @handyman = Handyman.new(handyman_params)
    # we need `user_id` to associate handyman with corresponding user
    @user = current_user
    @handyman.user = @user
    if @handyman.save
      redirect_to my_profile_path
    else
      render :new
    end
  end

  def edit
    @handyman = Handyman.find(params[:id])
  end

  def update
    @handyman = Handyman.find(params[:id])
    if @handyman.update(handyman_params)
      redirect_to my_profile_path, notice: 'handyman was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @handyman = Handyman.find(params[:id])
    @handyman.destroy
    redirect_to my_profile_path, notice: 'handyman was successfully deleted.'
  end


  private

  def handyman_params
    params.require(:handyman).permit(:description, :location)
  end
end
