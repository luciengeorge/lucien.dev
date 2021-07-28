class CreateWebsites < ActiveRecord::Migration[6.1]
  def change
    create_table :websites do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :url
      t.references :repo, foreign_key: true

      t.timestamps
    end
  end
end
