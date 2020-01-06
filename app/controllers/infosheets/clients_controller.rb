class Infosheets::ClientsController < ApplicationController
  def index
    render json: Client.all
  end

  def show
    @client = Client.find_by_id(params[:id])
    return render_not_found if @client.blank?
  end

  private

  def render_not_found
    render plain: 'Not Found :(', status: :not_found
  end
end
