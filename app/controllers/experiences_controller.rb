class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @experiences = policy_scope(Experience).includes(:rich_text_description, company: { photo_attachment: :blob })
    @programming_languages = ['Ruby on Rails', 'Javascript', 'Python', 'SQL', 'HTML', 'CSS,' 'git', 'Java']
    @spoken_languages = %w[French English Arabic Spanish]
    @educations = Education.includes(:school, :rich_text_description)
    respond_to do |format|
      format.html
      format.pdf do
        send_data generate_pdf, filename: 'lucien_george_cv.pdf', type: 'application/pdf'
      end
    end
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

  def generate_pdf
    pdf_content = render_to_string(
      CvComponent.new(experiences: @experiences, programming_languages: @programming_languages, spoken_languages: @spoken_languages, educations: @educations)
    )
    Prawn::Document.new do
      text pdf_content.force_encoding('Windows-1252'), inline_format: true
    end.render
  end
end
