class Infosheetmod::ClientsController < ApplicationController
  def index
    render json: Client.all
  end
end
