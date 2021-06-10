class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
