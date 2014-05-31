class Wallet < ActiveRecord::Base
  belongs_to :user

  has_many :transactions, class_name: 'WalletTransaction'

  def balancef
    if balance < 1.00
      "%.f¢" % (balance.round(2)*100)
    else
      "$%.2f" % balance.round(2)
    end
  end

end
