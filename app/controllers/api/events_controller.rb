class API::EventsController < ApplicationController

  before_action :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  skip_before_action :verify_authenticity_token

# turn off Devise on this controller
  before_action :authenticate_user!, except: [:create]
 
  def create
 		application = Application.find_by(url: request.env['HTTP_ORIGIN'])
    @event = Event.new(event_params)
    @event.application = application
  end

  def preflight
    head 200
  end

private
  def event_params
     params.require(:event).permit(:name)
  end
end
