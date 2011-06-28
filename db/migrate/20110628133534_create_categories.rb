class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name, :null => false
      t.string :description_header
      t.string :description 
    end
  end

  def self.down
    drop_table :categories
  end
end
