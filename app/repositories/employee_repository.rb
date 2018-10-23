require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  attr_reader :employees
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def list
    @employees
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      # attributes = {}
      # attributes[:id] = row[:id].to_i
      # attributes[:username] = row[:username]
      # attributes[:password] = row[:password]
      # @employees << Employee.new(attributes)

      row[:id] = row[:id].to_i
      row[:username] = row[:username]
      row[:password] = row[:password]
      row[:role] = row[:role]

      @employees << Employee.new(row)
      @next_id = row[:id]
    end
    @next_id += 1
  end
end
