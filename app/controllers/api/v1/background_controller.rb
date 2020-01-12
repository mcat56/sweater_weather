class Api::V1::BackgroundController < ApplicationController

  def new
    render locals: { facade: BackgroundFacade.new(params[:location]) }
  end

end
