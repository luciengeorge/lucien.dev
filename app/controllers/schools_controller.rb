class SchoolsController < ApplicationController
  def create
    @school = School.new(school_params)
    authorize @school
    if @school.save
      redirect_to new_education_path, notice: "#{@school.name} successfully created"
    else
      render 'educations/new'
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :city)
  end
end
