class CreateCollaborators < ActiveRecord::Migration[6.1]
  def change
    create_table :collaborators do |t|
      t.string :login
      t.string :avatar_url
      t.string :profile_url
      t.string :followers_url
      t.string :following_url
      t.string :starred_url
      t.integer :gh_id
      t.string :gh_type
      t.string :api_url

      t.timestamps
    end
  end
end
