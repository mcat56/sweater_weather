class Api::V1::ForecastController < ApplicationController

  def new
    facade = ForecastFacade.new(params[:location])
    serialized = ForecastSerializer.new(facade).serializable_hash
    render json: serialized
  end
end
