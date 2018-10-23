require_relative '../views/view'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository

    @view = View.new
  end

  def list_undelivered
    undelivered_orders = @order_repository.undelivered_orders
    @view.display_orders(undelivered_orders)
  end

  def add
    # ask for meal
    meal = ask_for_meal

    # ask for employee
    employee = ask_for_employee

    # ask for customer
    customer = ask_for_customer
    order = Order.new(meal: meal, customer: customer, employee: employee)
    # push new instance of order to orders array
    @order_repository.add(order)
  end

  def my_undelivered_orders
    # TODO

  end

  def mark_as_delivered
    # TODO

  end

  private

  def ask_for_meal
    meals = @meal_repository.all
    @view.display_meals(meals)
    meal_id = @view.ask_for('which number').to_i # => integer
    @meal_repository.find(meal_id)
  end

  def ask_for_customer
    customers = @customer_repository.all
    @view.display_customers(customers)
    customer_id = @view.ask_for('which number').to_i # => integer
    @customer_repository.find(customer_id)
  end

  def ask_for_employee
    employees = @employee_repository.all
    @view.display_employees(employees)
    employee_id = @view.ask_for('which number').to_i # => integer
    @employee_repository.find(employee_id)
  end
end






















