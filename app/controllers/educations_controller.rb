class EducationsController < ApplicationController
  def new
    @education = Education.new
    @school = School.new
    authorize @education
  end

  def create
    @education = Education.new(education_params)
    authorize @education
    if @education.save
      redirect_to experiences_path
    else
      render :new
    end
  end

  private

  def education_params
    params.require(:education).permit(:degree, :school_id, :start_date, :end_date, :description)
  end
end
