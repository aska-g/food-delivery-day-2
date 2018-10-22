require "csv"
require_relative "../models/meal"

class MealRepository
  def initialize(csv_file)
    # Array of Meal instances
    @meals = []
    @csv_file = csv_file
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def add(meal)
    # repo needs to set the id
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  def all
    return @meals
  end

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w(id name price)
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end


