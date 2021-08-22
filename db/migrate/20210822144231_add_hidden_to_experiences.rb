class AddHiddenToExperiences < ActiveRecord::Migration[6.1]
  def change
    add_column :experiences, :hidden, :boolean, default: false, null: false
  end
end
