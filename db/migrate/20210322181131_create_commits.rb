class CreateCommits < ActiveRecord::Migration[6.1]
  def change
    create_table :commits do |t|
      t.references :contributor, foreign_key: true
      t.references :repo, null: false, foreign_key: true
      t.text :message
      t.string :sha
      t.string :url
      t.string :html_url

      t.timestamps
    end
  end
end
