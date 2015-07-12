module API
  module V1
    class UsersController < ApplicationController

      layout false

      before_action :authenticate

      def index
        @users = User.order("first_name ASC, last_name ASC")
      end

      def new
        @user = User.new
      end

      def edit
        @user = User.find(params[:id])
      end

      def delete
        @user = User.find(params[:id])
      end

      def login
        # login form
      end

      # POST
      def attempt_login
        if params[:username].present? && params[:password].present?
          found_user = User.where(:username => params[:username]).first

          if found_user
            authorized_user = found_user.authenticate(params[:password])
          end
        end

        if authorized_user

          auth_token = found_user.generate_auth_token
          found_user.update_attributes(:auth_token => auth_token)

          render json: {auth_token: auth_token}, status: 200
        else
          render_unauthorized
        end

        # IF you have not an API and use Session
        #
        # if authorized_user
        #   # mark user as logged in
        #   session[:user_id] = authorized_user.id
        #   session[:username] = authorized_user.username
        #
        #   flash[:notice] = "You are now logged in."
        #   redirect_to(:action => 'index')
        # else
        #   flash[:notice] = "Invalid username/password combination."
        #   redirect_to(:action => 'login')
        # end

      end

      # POST
      def logout
        # mark user as logged out

        if params[:username].present?
          found_user = User.where(:username => params[:username]).first
        end

        if found_user
          found_user.update_attributes(:auth_token => nil)
          render json: 'Logged out', status: 200
        else
          render json: 'No user with such username', status: 400
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
      end

      def render_unauthorized
        self.headers['WWW-Authenticate'] = 'Token realm="Users"'
        render json: 'Bad credentials', status: 401
      end
    end
  end
end
