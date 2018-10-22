class Customer
  attr_reader :id, :name, :address
  attr_writer :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @address = attributes[:address] # string
  end
end

