class Infosheetmod::SectionsController < ApplicationController
  def index
    render json: Section.all
  end


end
