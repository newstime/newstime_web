class AddEditionCopyToWalletTransaction < ActiveRecord::Migration
  def change

    add_column :wallet_transactions, :edition_copy_id, :integer
    add_column :wallet_transactions, :subscription_id, :integer

    add_index :wallet_transactions, :edition_copy_id
    add_index :wallet_transactions, :subscription_id

    remove_column :wallet_transactions, :edition_id, :integer
    remove_column :wallet_transactions, :publication_id, :integer
  end
end
