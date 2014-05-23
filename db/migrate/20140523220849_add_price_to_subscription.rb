class AddPriceToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :price, :float, null: false, default: 0.0
  end
end
