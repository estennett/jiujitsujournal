class CreateRoadmaps < ActiveRecord::Migration
  def change
    create_table :roadmaps do |t|
      t.string :category
    end
  end
end
