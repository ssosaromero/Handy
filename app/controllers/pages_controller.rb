class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:search].present?
      @handyman = Handyman.global_search(params[:search][:query])
    else
      @handyman = Handyman.all.sample(3)
    end
  end

  def my_profile
    @user = current_user

    @reviews_user = @user.reviews.filter do |r|
      r.author != @user.email
    end

    if @user.handyman
      @reviews_handyman = @user.handyman.reviews.filter do |r|
        r.author != @user.email
      end
    end
  end

end
