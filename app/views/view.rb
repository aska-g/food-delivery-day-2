class View
  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name} #{meal.price}$"
    end
  end

  def display_customers(customers)
    customers.each do |customer|
      puts "#{customer.id}. #{customer.name} | live at => #{customer.address}"
    end
  end

  def display_orders(orders)
    orders.each do |order|
      puts "#{order.id}. Meal: #{order.meal.name} - Customer: #{order.customer.name} - Employee: #{order.employee.username}"
    end
  end

  def display_employees(employees)
    employees.each do |employee|
      puts "#{employee.id}. #{employee.username}"
    end
  end

  def ask_for(something)
    puts "#{something}?"
    return gets.chomp
  end

  def welcome(employee)
    puts "Welcome, #{employee.username}"
  end

  def wrong_credentials
    puts "Wrong credentials, try again!"
  end
end
