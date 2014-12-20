class UsersController < ApplicationController
    before_action :find_user, only: [:update, :show]

    def new
        @user = User.new
    end

    def create
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
end
