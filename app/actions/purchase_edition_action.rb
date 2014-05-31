# Purchases and edition on the users account.
class PurchaseEditionAction

  attr_reader :user, :edition, :wallet

  def initialize(user, edition)
    @user = user
    @edition = edition

    @wallet = user.wallet
  end

  def preform
    # Ensure user doesn't already have a copy of the edition.
    raise "User already owns copy of edition" if user.editions.exists?(edition) # Add unique constraint

    # Ensure there is enough balance in the users wallet
    raise "Insufficient funds for purchase" if wallet.balance < edition.price


    EditionPurchase.transaction do
      # Record edition purchase for the edition.
      EditionPurchase.create(edition: edition, user: user, price: edition.price)

        # Compute amounts
        debit_amount = -edition.price
        new_wallet_balance = (wallet.balance - edition.price).round(2)

        # Record edition purchase wallet transaction
        EditionPurchaseWalletTransaction.create(
          wallet: wallet,
          edition: edition,
          amount: debit_amount,
          balance: new_wallet_balance
        )

        # Update Wallet Balance
        wallet.update_attributes(balance: new_wallet_balance)

      # Issue Copy to User
      EditionCopy.create(user: user, edition: edition) # Should include license to read.
    end
  end

end
