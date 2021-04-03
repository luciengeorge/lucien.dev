class AddPushedAtToCommits < ActiveRecord::Migration[6.1]
  def change
    add_column :commits, :pushed_at, :datetime
  end
end
