require_relative "../views/view"

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = View.new
  end

  def login
    # ask for username - view
    username = @view.ask_for(:username)
    # ask for password - view
    password = @view.ask_for(:password)

    # check if credentials valid - repo
    @current_user = @employee_repository.find_by_username(username)

    if @current_user && @current_user.password == password
    # if valid - welcome - view
      @view.welcome(@current_user)
    #    return current user
      return @current_user
    else
      # if not, wrong credentials - view
      @view.wrong_credentials
      # login
      login
    end
  end
end
