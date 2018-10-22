require_relative "../views/view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = View.new
  end

  def list
    # get the customers from CustomerRepo
    customers = @customer_repository.all
    # send the customers to the view
    @view.display_customers(customers)
  end

  def add
    # ask the user for  name
    name = @view.ask_for("name")
    # ask the user for  price
    address = @view.ask_for("address")
    # create a Meal instance
    customer = Customer.new({name: name, address: address})
    # add the meal to the repo
    # meal.id => nil
    @customer_repository.add(customer)
  end
end
