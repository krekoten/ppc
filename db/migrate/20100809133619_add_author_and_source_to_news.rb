class AddAuthorAndSourceToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :author, :string
    add_column :news, :source, :string
  end

  def self.down
    remove_column :news, :author
    remove_column :news, :source
  end
end
