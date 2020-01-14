class Api::V1::RoadtripsController < ApplicationController

  def new
    if !params[:api_key] || User.find_by(api_key: params[:api_key]) == nil
      render status: :unauthorized, body: 'Unauthorized'
    else
      facade = RoadtripFacade.new(params[:origin], params[:destination])
      serialized = RoadtripSerializer.new(facade)
      render json: serialized
    end
  end
end
