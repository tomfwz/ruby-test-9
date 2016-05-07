class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :sku
      t.references :brand, index: true
      t.attachment :picture
    end
  end
end
