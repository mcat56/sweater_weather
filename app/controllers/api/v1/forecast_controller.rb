class Api::V1::ForecastController < ApplicationController

  def create
    render local: ForecastFacade.new(params[:location])
  end

end
