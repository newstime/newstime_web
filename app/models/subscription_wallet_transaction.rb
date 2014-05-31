class SubscriptionWalletTransaction < WalletTransaction
  belongs_to :wallet
  belongs_to :subscription
  has_one :publication, through: :subscription
end
