class Infosheets::SectionsController < ApplicationController
  def index
    render json: Section.where(client_id: current_client.id)
  end

  def show
    @section = Section.find_by_id(params[:id])
    return render_not_found if @section.blank?
  end

  private

  def render_not_found
    render plain: 'Not Found :(', status: :not_found
  end

  helper_method :current_client
  def current_client
    @current_client ||= Client.find(params[:client_id])
  end

end
