class CreateCategoriesLists < ActiveRecord::Migration
  def self.up
    create_table :categories_lists do |t|
    	t.integer :category_id
    	t.integer :list_id
    	end
  	add_index :categories_lists, [:category_id, :list_id]
  end

  def self.down
  	drop_table :categories_lists
  end
end
