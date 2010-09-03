class AddFieldsToSacredObjects < ActiveRecord::Migration
  def self.up
    add_column :sacred_objects, :eparchy, :string
    add_column :sacred_objects, :decanat, :string
    add_column :sacred_objects, :region, :string
    add_column :sacred_objects, :district, :string
    add_column :sacred_objects, :city, :string
  end

  def self.down
    remove_column :sacred_objects, :eparchy
    remove_column :sacred_objects, :decanat
    remove_column :sacred_objects, :region
    remove_column :sacred_objects, :district
    remove_column :sacred_objects, :city
  end
end
