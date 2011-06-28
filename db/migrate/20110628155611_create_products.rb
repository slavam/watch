class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.references :category, :null => false
      t.string :model
      t.string :name, :null => false
      t.string :description
      t.decimal :price_net
      t.decimal :price_gross
    end
  end

  def self.down
    drop_table :products
  end
end
