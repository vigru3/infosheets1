class ApplicationController < ActionController::Base
  def render_not_found
    render plain: 'Not Found :(', status: :not_found
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end
end
