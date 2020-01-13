class Api::V1::AntipodeController < ApplicationController

  def new
    facade = AntipodeFacade.new(params[:location])
    serialized = AntipodeSerializer.new(facade)
    require "pry"; binding.pry
    render json: serialized
  end


end
