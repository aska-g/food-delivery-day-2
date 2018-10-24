require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv_file, meal_repository, employee_repository, customer_repository)
    @orders = []
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @csv_file = csv_file
    @next_id = 1
    load_csv
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end


  def add(order)
    # repo needs to set the id
    order.id = @next_id
    @next_id += 1
    @orders << order
    save_csv
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  def save
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:delivered] = row[:delivered] == 'true'

      @orders << Order.new(row)
    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w(id meal_id customer_id employee_id delivered)
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered]
      end
    end
  end
end

