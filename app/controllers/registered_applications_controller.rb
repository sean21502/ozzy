class RegisteredApplicationsController < ApplicationController
  def index
  	@registeredapplications = RegisteredApplication.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
