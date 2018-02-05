class CreateProductImages < ActiveRecord::Migration[5.1]
  def change
    create_table :product_images do |t|
      t.integer :product_id
      t.string :image
      t.string :original_filename

      t.timestamps null: false
    end
  end
end
