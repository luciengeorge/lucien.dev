class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @experiences = policy_scope(Experience).includes(:rich_text_description, company: { photo_attachment: :blob })
    @programming_languages = ['Ruby on Rails', 'Javascript', 'Python', 'SQL', 'HTML', 'CSS,' 'git', 'Java']
    @spoken_languages = %w[French English Arabic Spanish]
    @educations = Education.includes(:school)
  end

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(experience_params)
    authorize @experience
    if @experience.save
      redirect_to experiences_path
    else
      render :new
    end
  end

  private

  def experience_params
    params.require(:experience).permit(:title, :start_date, :end_date, :company_id, :description, :job_type)
  end
end
