class CompaniesController < ApplicationController
  def new
    @company = Company.new
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    authorize @company
    if @company.save
      redirect_to new_company_path
    else
      flash[:alert] = @company.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :website, :address, :photo)
  end
end
