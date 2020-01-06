class Infosheetmod::InfosController < ApplicationController
  def index
    render json: Info.where(section_id: current_section.id)
  end

  def show
    @info = Info.find_by_id(params[:id])
    return render_not_found if @info.blank?
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

  def info_params
    params.require(:info).permit(:infoname)
  end

  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end
end
