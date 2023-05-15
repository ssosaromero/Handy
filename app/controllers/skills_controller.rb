class SkillsController < ApplicationController
  def new
    @skill = Skill.new
    @handyman = Handyman.find(params[:handyman_id])
  end

  def create
    @skill = Skill.new(skill_params)
    @handyman = Handyman.find(params[:handyman_id])
    @skill.handyman = @handyman
    if @skill.save
      redirect_to my_profile_path
    else
      render new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to my_profile_path
    else
      render new
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to my_profile_path
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :level, :description)
  end
end
