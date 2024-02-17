class ApplicationController < ActionController::Base

  include Authentication
  include OrderConcern
end
