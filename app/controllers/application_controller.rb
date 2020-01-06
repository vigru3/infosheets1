class ApplicationController < ActionController::Base
  def render_not_found
    render plain: 'Not Found :(', status: :not_found
  end
end
