class CreateTechniques < ActiveRecord::Migration
  def change
    create_table :techniques do |t|
      t.string :name
      t.string :description
      t.string :video_url
      t.timestamps :created_at
    end
  end
end
