class Clientmod::ClientsController < ApplicationController
  def index
    render json: Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.create(client_params)
    redirect_to dashboard_path
  end

  def show
    @client = Client.find_by_id(params[:id])
    return render_not_found if @client.blank?
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

  def client_params
    params.require(:client).permit(:clientname)
  end
end
