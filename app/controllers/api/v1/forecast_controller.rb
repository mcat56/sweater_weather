class Api::V1::ForecastController < ApplicationController

  def create
    @facade = ForecastFacade.new(params[:location])
    binding.pry
    # render locals: { facade: ForecastFacade.new(params[:location]) }
  end

end
