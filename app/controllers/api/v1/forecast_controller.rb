class Api::V1::ForecastController < ApplicationController

  def create
    render locals: { facade: ForecastFacade.new(params[:location]) }
  end
end
