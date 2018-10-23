class Order
  attr_reader :meal, :customer, :employee, :delivered
  attr_accessor :id

  def initialize(attr={})
    @id = attr[:id]
    @meal = attr[:meal]
    @employee = attr[:employee]
    @customer = attr[:customer]
    @delivered = attr[:delivered]
  end

  def delivered?
    @delivered || false
  end

  def deliver!
    @delivered = true
  end
end
