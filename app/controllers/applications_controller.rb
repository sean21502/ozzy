class ApplicationsController < ApplicationController
  
  def index
  	@applications = Application.all
  end

	def new
   	@application = Application.new
  end

  def show
  	@user = current_user
    @applications = @user.applications.find(params[:id])
    @events = @application.events.group_by(&:name)
  end

  def create
    @application = Application.new(application_params)
   
    @application.user = current_user

   	if @application.save
      flash[:notice] = "Application was saved."
      redirect_to @application
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

	def edit
    @application = Application.find(params[:id])
   end

  def update
    @application = Application.find(params[:id])
    @application.assign_attributes(application_params)

    if @application.save
      flash[:notice] = "Application was updated."
      redirect_to [@application]
    else
      flash.now[:alert] = "There was an error saving the application. Please try again."
      render :edit
    end
  end
    def destroy
    @application = Application.find(params[:id])
    
    if @application.destroy
      flash[:notice] = "\"#{@application.name}\" was deleted successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error deleting the application."
      render :show
    end
  end

private

  def application_params
    params.require(:application).permit(:name, :url)
  end
end
