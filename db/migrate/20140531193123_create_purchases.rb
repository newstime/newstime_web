class CreatePurchases < ActiveRecord::Migration
  def change
    drop_table :edition_purchases

    create_table :purchases do |t|
      t.string :type
      t.references :user, index: true
      t.float :total
      t.references :edition_copy, index: true
      t.references :subscription, index: true

      t.timestamps
    end
  end
end
