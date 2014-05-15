class CreateEditions < ActiveRecord::Migration
  def change
    create_table :editions do |t|
      t.string :name
      t.string :slug
      t.string :zip_name
      t.string :publish_date
      t.string :fmt_price
      t.string :volume_label

      t.references :publication
      t.references :user
      t.references :organization

      t.timestamps
    end

    add_index :editions, :publication_id
    add_index :editions, :user_id
    add_index :editions, :organization_id

    #add_attachment :editions, :cover
  end
end
