require 'rails_helper'
require 'random_data'

RSpec.describe ApplicationController, type: :controller do

  before(:each) do
    @my_user = FactoryBot.create(:user)
    @my_application = FactoryBot.create(:application, user: @my_user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: @my_application.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: @my_user.id }
      expect(response).to render_template :show
    end

    it "assigns @my_application to @application" do
      get :show, params: { id: @my_user.id }
      expect(assigns(:application)).to eq(@my_application)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @application" do
      get :new
      expect(assigns(:application)).not_to be_nil
    end
  end

    describe "APPLICATION create" do
    it "increases the number of Application by 1" do
      expect{ post :create, params: { application: { name: RandomData.random_sentence , url: RandomData.random_sentence}}}.to change(Application,:count).by(1)
    end

    it "assigns the new post to @application" do
      post :create, params: { application: { name: RandomData.random_sentence , url: RandomData.random_sentence}}
      expect(assigns(:wiki)).to eq Application.last
    end

    it "redirects to the new application" do
      post :create, params: { application: { name: RandomData.random_sentence , url: RandomData.random_sentence}}
      expect(response).to redirect_to Application.last
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: { id: @my_user.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: { id: @my_user.id }
      expect(response).to render_template :edit
    end

    it "assigns post to be updated to @application" do
      get :edit, params: { id: @my_user.id }

      application_instance = assigns(:application)

      expect(application_instance.id).to eq @my_user.id
      expect(application_instance.name).to eq @my_application.title
      expect(application_instance.url).to eq @my_application.body
    end
  end

  describe "PUT update" do
    it "updates post with expected attributes" do
      new_name = RandomData.random_sentence
      new_url = RandomData.random_sentence

      put :update, params: { id: @my_user.id, application: {name: new_name, url: new_url } }

      updated_application = assigns(:application)
      expect(updated_application.id).to eq @my_user.id
      expect(updated_application.name).to eq new_name
      expect(updated_application.url).to eq new_url
    end

    it "redirects to the updated application" do
      new_name = RandomData.random_sentence
      new_urk = RandomData.random_sentence

      put :update, params: { id: @my_user.id, application: {name: new_name, url: new_url } }
      expect(response).to redirect_to @my_application
    end
  end

  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, params: { id: @my_user.id }
      count = Application.where({id: @my_user.id}).size
      expect(count).to eq 0
    end

    it "redirects to posts index" do
      delete :destroy, params: { id: @my_user.id }
      expect(response).to redirect_to root_path
    end
  end

end
