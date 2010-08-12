class DropIdFromNewsSacredObjects < ActiveRecord::Migration
  def self.up
    remove_column :news_sacred_objects, :id
  end

  def self.down
  end
end
