module FormatHelpers

  def format_currency(value)
    return unless value
    if value <= 0
      "FREE"
    elsif value < 1.00
      "%.f¢" % (value.round(2)*100)
    else
      "$%.2f" % value.round(2)
    end
  end

  def format_transaction_amount(value)
    return unless value
    if value.zero?
      "$0.00"
    elsif value > 0
      "$%.2f" % value.round(2)
    else
      "($%.2f)" % value.round(2).abs
    end
  end

  def format_date(date)
    date.strftime("%m/%d/%Y")
  end

  def format_size(size, units="Mb")
    "#{size}#{units}"
  end

end
