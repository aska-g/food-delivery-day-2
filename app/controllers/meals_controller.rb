require_relative "../views/view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = View.new
  end

  def list
    # get the meals from MealRepo
    meals = @meal_repository.all
    # send the meals to the view
    @view.display_meals(meals)
  end

  def add
    # ask the user for  name
    name = @view.ask_for("name")
    # ask the user for  price
    price = @view.ask_for("price").to_i
    # create a Meal instance
    meal = Meal.new({name: name, price: price})
    # add the meal to the repo
    # meal.id => nil
    @meal_repository.add(meal)
  end
end
