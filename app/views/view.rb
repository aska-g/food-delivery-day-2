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

  def ask_for(something)
    puts "#{something}?"
    return gets.chomp
  end
end
