class Wallet < ActiveRecord::Base
  belongs_to :user

  def balancef
    if balance < 1.00
      "%.f¢" % (balance.round(2)*100)
    else
      "$%.2f" % balance.round(2)
    end
  end

end
