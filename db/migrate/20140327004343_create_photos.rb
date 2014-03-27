class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :photographer
      t.integer :type

      t.timestamps
    end
  end
end
