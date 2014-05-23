class AddSubscriptionPriceToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :subscription_price, :float
  end
end
