class Meal
  attr_reader :id, :name, :price
  attr_writer :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @price = attributes[:price] # integer
  end
end

# meal = Meal.new({price: 10, id: 1})

# p meal
# # VIEW LATER
# # 1. pizza 30$
# # meal.id meal.name meal.price

# # REPO LATER
# # meal.id = @next_id
