class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  # on api, you can you with: :null_session
  protect_from_forgery with: :null_session

#  before_action :setup_navigation
  before_action :accept_headers
  #before_action ->{ @remote_ip = request.headers['REMOTE_ADDR'] }

  private

  # # checks session if user is logged in
  # def confirm_logged_in
  #   unless session[:user_id]
  #     flash[:notice] = "Please log in."
  #     redirect_to(:controller => 'v1/users', :action => 'login')
  #     false # halts the before_action
  #   else
  #     true
  #   end
  # end

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Bike Travel API"'
    render json: 'Bad credentials', status: 401
  end

  def accept_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def setup_navigation
    # @subjects = Subject.visible.order("subjects.position ASC")
  end
end