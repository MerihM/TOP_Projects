require "application_responder"

class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  self.responder = ApplicationResponder
  respond_to :html
  

end
