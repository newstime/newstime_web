class SubscriptionWalletTransaction < WalletTransaction
  belongs_to :wallet
  belongs_to :publication
end
