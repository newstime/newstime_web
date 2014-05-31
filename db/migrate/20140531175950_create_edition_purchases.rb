class CreateEditionPurchases < ActiveRecord::Migration
  def change
    create_table :edition_purchases do |t|
      t.references :edition, index: true
      t.references :user, index: true
      t.float :price

      t.timestamps
    end
  end
end
