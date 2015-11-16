class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :comments
      t.string :sparring_partners
      t.timestamps :created_at
    end
  end
end
