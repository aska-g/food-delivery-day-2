# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running    = true
  end

  def run
    puts "Welcome to the Food delivery app!"
    puts "           --           "

    while @running
      @current_user = @sessions_controller.login

      while @current_user
        if @current_user.manager?
          display_manager_tasks
        else
          display_delivery_guy_tasks
        end

        action = gets.chomp.to_i
        print `clear`

        if @current_user.manager?
          route_manager_action(action)
        else
          route_delivery_guy_action(action)
        end
      end
    end
  end

  private

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered
    when 6 then @orders_controller.add

    when 8 then @current_user = nil
    when 9 then stop
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

  def route_delivery_guy_action(action)
    case action
    when 1 then @orders_controller.my_undelivered_orders(@current_user)
    when 2 then @orders_controller.mark_as_delivered(@current_user)

    when 8 then @current_user = nil
    when 9 then stop
    else
      puts "Please press 1, 2, 6"
    end
  end

  def stop
    @current_user = nil
    @running = false
  end

  def display_manager_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Create a new meal"
    puts "3 - List all customers"
    puts "4 - Add a new customer"
    puts "5 - List undelivered orders"
    puts "6 - Create an order"

    puts "8 - Log out"
    puts "9 - Stop and exit the program"
  end

  def display_delivery_guy_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List my undelivered orders"
    puts "2 - Mark order as delivered"
    puts "8 - Log out"
    puts "9 - Stop and exit the program"
  end
end
