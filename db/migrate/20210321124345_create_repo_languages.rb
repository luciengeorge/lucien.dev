class CreateRepoLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :repo_languages do |t|
      t.references :language, null: false, foreign_key: true
      t.references :repo, null: false, foreign_key: true
      t.integer :size

      t.timestamps
    end
  end
end
