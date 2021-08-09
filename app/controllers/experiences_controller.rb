class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index resume]
  before_action :set_experiences, only: %i[index resume]
  layout 'full_screen', only: :resume

  def index
    respond_to do |format|
      format.html
      format.pdf do
        grover = Grover.new(resume_experiences_url, format: 'A4')
        pdf = grover.to_pdf
        send_data(pdf, filename: 'lucien_george_resume.pdf')
      end
    end
  end

  def resume
    skip_authorization
  end

  def new
    @experience = Experience.new
    @companies = Company.order(:name)
    authorize @experience
  end

  def create
    @experience = Experience.new(experience_params.merge(rank: 1))
    authorize @experience
    if @experience.save
      redirect_to new_experience_path
    else
      render :new
    end
  end

  private

  def experience_params
    params.require(:experience).permit(:title, :start_date, :end_date, :company_id, :description, :job_type)
  end

  def set_experiences
    @experiences = policy_scope(Experience).order(rank: :asc).includes(:rich_text_description, company: { photo_attachment: :blob })
    @programming_languages = ['Ruby on Rails', 'Javascript', 'Python', 'SQL', 'HTML', 'CSS', 'React', 'git', 'Java', 'Kotlin']
    @spoken_languages = %w[French English Arabic Spanish]
    @educations = Education.order(start_date: :desc).includes(:school, :rich_text_description)
  end
end
