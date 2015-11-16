class AddForeignKeyTo < ActiveRecord::Migration
  def change
    add_column :techniques, :entry_id, :integer
    add_column :techniques, :user_id, :integer
  end
end
