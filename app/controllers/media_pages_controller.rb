class MediaPagesController < ApplicationController
before_action :find_media_page, only: [:show, :update, :destroy]
    def index
        @media_pages = MediaPage.all
        @users = User.all
    end

    def show
    end

    def new
        @media_page = MediaPage.new
    end

    def create
        @user = User.find(params[:user_id])
        @media_page = MediaPage.new(media_page_params)
        if @media_page.save
            redirect_to @user
        else
            Rails.logger.info(@media_page.errors.inspect)
            render action: 'new'
        end
    end

    def update
    end

    def destroy
        @media_page.destroy
        redirect_to media_page
    end

    private
    def find_media_page
        @media_page = MediaPage.find(params[:id])
    end

    def media_page_params
        params.require(:media_page).permit(:name, :content).merge(:user_id => current_user.id)
    end

end
