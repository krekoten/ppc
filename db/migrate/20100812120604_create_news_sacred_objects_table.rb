class CreateNewsSacredObjectsTable < ActiveRecord::Migration
  def self.up
    create_table :news_sacred_objects do |t|
      t.integer :news_id
      t.integer :sacred_object_id
    end

    add_index :news_sacred_objects, [:news_id, :sacred_object_id], :unique => true
  end

  def self.down
    drop_table :news_sacred_objects
  end
end
