class AntipodeController < ApplicationController

  def new
    facade = AntipodeFacade.new(params[:location])
    serialized = AntipodeSerializer.new(facade)
    render json: serialized
  end


end
