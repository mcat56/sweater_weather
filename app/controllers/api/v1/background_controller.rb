class Api::V1::BackgroundController < ApplicationController

  def new
    facade = BackgroundFacade.new(params[:location])
    serialized = BackgroundSerializer.new(facade)
    render json: serialized
  end
end
