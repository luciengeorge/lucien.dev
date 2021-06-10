class AddJobTypeToExperiences < ActiveRecord::Migration[6.1]
  def change
    add_column :experiences, :job_type, :integer, default: 0, null: false
  end
end
