class Infosheetmod::SectionsController < ApplicationController
  def index
    render json: Section.where(client_id: current_client.id)
  end

  def show
    @section = Section.find_by_id(params[:id])
    return render_not_found if @section.blank?
  end
  
  def new
    @section = current_client.sections.new
  end

  def create
    @section = current_client.sections.create(section_params)
    redirect_to dashboard_path
  end

  def edit
    @section = Section.find_by_id(params[:id])
    return render_not_found if @section.blank?
  end

  def update
    @section = Section.find_by_id(params[:id])
    return render_not_found if @section.blank?

    @section.update(section_params)

    if @section.valid?
      redirect_to root_path
    else 
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @section = Section.find_by_id(params[:id])
    return render_not_found if @section.blank?
    @section.destroy
    redirect_to root_path
  end

  private

  def section_params
    params.require(:section).permit(:sectionname, :client_id)
  end

  helper_method :current_client
  def current_client
    @current_client ||= Client.find(params[:client_id])
  end
end
