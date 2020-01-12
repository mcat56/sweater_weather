class Api::V1::ForecastController < ApplicationController

  def new
    facade = ForecastFacade.new(params[:location])
    serialized = ForecastSerializer.new(facade)
    binding.pry
    render json: serialized
  end
end
