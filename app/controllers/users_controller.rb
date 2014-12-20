class UsersController < ApplicationController
    before_action :find_user, only: [:update, :show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user
        else
            flash[:notice] = "Unable to sign up! Try again"
            render "new"
        end
    end

    def update
    end

    def show

    end

    def index
        @users = User.all
    end

    private
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
