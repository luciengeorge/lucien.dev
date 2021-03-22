class AddColorToLanguages < ActiveRecord::Migration[6.1]
  def change
    add_column :languages, :color, :string
  end
end
