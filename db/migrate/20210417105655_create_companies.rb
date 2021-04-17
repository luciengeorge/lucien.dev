class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :location
      t.float :latitute
      t.float :longitude

      t.timestamps
    end
  end
end
