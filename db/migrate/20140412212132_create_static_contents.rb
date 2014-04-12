class CreateStaticContents < ActiveRecord::Migration
  def change
    create_table :static_contents do |t|
      t.text :about
      t.string :contact_email
      t.string :contact_number
      t.text :contact_blurb

      t.timestamps
    end
  end
end
