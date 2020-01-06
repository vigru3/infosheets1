class Infosheetmod::SectionsController < ApplicationController
  def index
    render json: Section.where(client_id: current_client.id)
  end

  def show
    @section = Section.find_by_id(params[:id])
    return render_not_found if @section.blank?
  end
  
  def new
    @client = Client.new
  end

  def create
    @client = Client.create(client_params)
    redirect_to root_path
  end

  def edit
    @client = Client.find_by_id(params[:id])
    return render_not_found if @client.blank?
  end

  def update
    @client = Client.find_by_id(params[:id])
    return render_not_found if @client.blank?

    @client.update(client_params)

    if @client.valid?
      redirect_to root_path
    else 
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client = Client.find_by_id(params[:id])
    return render_not_found if @client.blank?
    @client.destroy
    redirect_to root_path
  end

  private

  def section_params
    params.require(:section).permit(:sectionname)
  end

  helper_method :current_client
  def current_client
    @current_client ||= Client.find(params[:client_id])
  end
end
