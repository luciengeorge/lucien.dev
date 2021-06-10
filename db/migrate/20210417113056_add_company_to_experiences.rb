class AddCompanyToExperiences < ActiveRecord::Migration[6.1]
  def change
    add_reference :experiences, :company, null: false, foreign_key: true
  end
end
