class Infosheetmod::SectionsController < ApplicationController
  def index
    render json: Section.where(client_id: current_client.id)
  end

  def show
    @section = Section.find_by_id(params[:id])
    return render_not_found if @section.blank?
  end

  private

  helper_method :current_client
  def current_client
    @current_client ||= Client.find(params[:client_id])
  end
end
