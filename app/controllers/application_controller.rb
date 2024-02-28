class ApplicationController < ActionController::Base
  include Authentication
  include AuthenticationRoles
  include OrderConcern
end
