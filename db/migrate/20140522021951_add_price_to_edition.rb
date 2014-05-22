class AddPriceToEdition < ActiveRecord::Migration
  def change
    add_column :editions, :price, :float, null: false, default: 0.00
  end
end
