class CreateSacredObjects < ActiveRecord::Migration
  def self.up
    create_table :sacred_objects do |t|
      t.string :title
      t.text :contacts
      t.text :history

      t.timestamps
    end
  end

  def self.down
    drop_table :sacred_objects
  end
end
