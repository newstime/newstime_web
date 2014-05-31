class CreateWalletTransactions < ActiveRecord::Migration
  def change
    create_table :wallet_transactions do |t|
      t.references :wallet, index: true
      t.string :type
      t.float :amount
      t.float :balance

      t.references :edition, index: true
      t.references :publication, index: true

      t.timestamps
    end
  end
end
