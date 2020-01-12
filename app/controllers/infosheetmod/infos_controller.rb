class Infosheetmod::InfosController < ApplicationController
  def index
    render json: Info.where(section_id: current_section.id)
  end

  def show
    @info = Info.find_by_id(params[:id])
    return render_not_found if @info.blank?
  end

  def new
    @info = current_section.infos.new
  end

  def create
    @info = current_section.infos.create(info_params)
    redirect_to dashboard_path
  end

  def edit
    @info = Info.find_by_id(params[:id])
    return render_not_found if @info.blank?
  end

  def update
    @info = Info.find_by_id(params[:id])
    return render_not_found if @info.blank?

    @info.update(info_params)

    if @info.valid?
      redirect_to root_path
    else 
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @info = Info.find_by_id(params[:id])
    return render_not_found if @info.blank?
    @info.destroy
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
