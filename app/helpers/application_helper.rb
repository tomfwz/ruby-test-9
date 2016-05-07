module ApplicationHelper
  def to_currency(amount, unit: '$')
    unit = "#{unit}" if unit.present?
    number_to_currency(amount, :unit => unit, :separator => ".", :delimiter => ",", format: "%u%n")
  end
end
