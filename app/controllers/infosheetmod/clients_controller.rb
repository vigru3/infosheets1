class Infosheetmod::ClientsController < ApplicationController
  def index
    render json: Client.all
  end

  def show
    @client = Client.find_by_id(params[:id])
    return render_not_found if @client.blank?
  end
end
