require 'rails_helper'

RSpec.describe MediaPagesController, :type => :controller do
    describe "GET #index" do
        it "populates media" do
            media_page = FactoryGirl.create(:media_page)
            get :index
            assigns(:media_pages).should eq([media_page])
        end

        it "renders the :index view" do
            get :index
            response.should render_template :index
        end
    end

    describe "GET #show" do
        it "shows one user media" do
            media_page = FactoryGirl.create(:media_page)
            get :show, id: media_page
            assigns(:media_page).should eq(media_page)
        end

        it "renders the :show template" do
            get :show, id: FactoryGirl.create(:media_page)
            response.should render_template :show
        end
    end

    describe "GET #new" do
        it "assigns new Media to @media_page" do
            get :new, id: media_page
            assigns(:media_page).should eq(media_page)
        end

        it "renders the :new template" do
            get :new, id: FactoryGirl.create(:media_page)
            response.should render_template :new
    end

    describe "POST #create" do
        context "with valid attributes" do
            it "saves new media to database" do
                expect {
                    post :create, media_page: FactoryGirl.attributes_for(:media_page)
                }.to change(MediaPage,:count).by(1)
            end

            it "redirects to the new media" do
                post :create, media_page: FactoryGirl.attributes_for(:media_page)
                response.should redirect_to MediaPage.last
            end
        end

        context "with invalid attributes" do
            it "does not save to database" do
                expect{
                    post :create, media_page: FactoryGirl.attributes_for(:invalid_media_page)
                }.to_not change(MediaPage,:count)
            end

            it "re-renders new action" do
                post :create, media_page: FactoryGirl.attributes_for(:invalid_media_page)
                response.should render_template :new
            end
        end
    end

    describe "PUT #update" do
        before :each do
            @media_page = MediaPage(:media_page, name: "Cool Link", content: "www.neillsilva.com")
        end

        context "valid attributes" do
            it "locates the requested @media_page" do
                put :update, id: @media_page, media_page: FactoryGirl.attributes_for(:media_page)
                assigns(:media_page).should eq(@media_page)
            end

            it "changes @media_page's attributes" do
                put :update, id: @media_page,
                    media_page: FactoryGirl.attributes_for(:media_page, name: "Cooler Link", content: "www.neillsilva.com")
                @media_page.reload
                @media_page.name.should eq("Cooler Link")
                @media_page.content.should eq("www.neillsilva.com")
            end

            it "redirects to updated media_page" do
                put :update, id: @media_page, media_page: FactoryGirl.attributes_for(:media_page)
                response.should redirect_to @media_page
            end
        end

        context "invalid attributes" do
            it "locates the requested @media_page" do
                put :update, id: @media_page, media_page: FactoryGirl.attributes_for(:media_page)
                assigns(:media_page).should eq(@media_page)
            end

            it "does not change @media_page's attributes" do
                put :update, id: @media_page,
                    media_page: FactoryGirl.attributes_for(:media_page, name: "Cooler Link", content: nil)
                @media_page.reload
                @media_page.name.should_not eq("Cooler Link")
                @media_page.content.should eq("www.neillsilva.com")
            end

            it "re-renders the edit method" do
                put :update, id: @media_page, media_page: FactoryGirl.attributes_for(:invalid_media_page)
                response.should render_template :edit
            end
        end
    end

    describe "DELETE #destroy" do
        before :each do
            @media_page = FactoryGirl.create(:media_page)
        end

        it "deletes the media_page" do
            expect{
                delete :destroy, id: @media_page
                }.to change(MediaPage,:count).by(-1)
        end

        it "redirects to the media_page#index" do
            delete :destroy, id: @media_page
            response.should redirect_to user_media_pages_path
        end
    end
end
end
