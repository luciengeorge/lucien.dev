class CreateEducations < ActiveRecord::Migration[6.1]
  def change
    create_table :educations do |t|
      t.references :school, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :degree

      t.timestamps
    end
  end
end
