class AddRankToExperiences < ActiveRecord::Migration[6.1]
  def up
    add_column :experiences, :rank, :integer

    Experience.order(start_date: :desc).each_with_index do |experience, index|
      experience.update(rank: index + 1)
    end
  end
end
