class Infosheets::InfosController < ApplicationController
  def index
    render json: Info.where(section_id: current_section.id)
  end

  def show
    @info = Info.find_by_id(params[:id])
    return render_not_found if @info.blank?
  end

  private

  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end
end
