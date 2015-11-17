class AddForeignKeyToTechnique < ActiveRecord::Migration
  def change
    add_column :techniques, :roadmap_id, :integer
  end
end
