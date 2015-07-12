class AccessController < ApplicationController

  layout 'admin'

  #before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    # display text and links
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil

    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

  def render_unauthorized
    # self.headers['WWW-Authenticate'] = 'Token realm="Travels"'

    respond_to do |format|
      format.json { render json: 'Bad credentials', status: 401 }
      format.xml { render xml: 'Bad credentials', status: 401 }
    end
  end

  private

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end
end
