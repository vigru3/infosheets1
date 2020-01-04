class Clientmod::ClientsController < ApplicationController
  def index
    render json: Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.create(client_params)
    redirect_to root_path
  end

  def show
    @client = Client.find(params[:id])
  end

  private

  def client_params
    params.require(:client).permit(:clientname)
  end

end
