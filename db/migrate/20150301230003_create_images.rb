class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :image_size
      t.string :camera_angle
      t.string :stock_ref
      t.string :plate_reg
      t.string :url
      t.string :obfuscated
      t.timestamps null: false
    end
  end
end
