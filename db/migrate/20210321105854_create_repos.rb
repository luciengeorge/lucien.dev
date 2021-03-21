class CreateRepos < ActiveRecord::Migration[6.1]
  def change
    create_table :repos do |t|
      t.string :name
      t.string :full_name
      t.boolean :private
      t.jsonb :owner
      t.string :html_url
      t.string :api_url
      t.boolean :fork
      t.datetime :pushed_at
      t.string :git_url
      t.string :homepage
      t.integer :size
      t.integer :stars
      t.integer :forks
      t.integer :open_issues

      t.timestamps
    end
  end
end
