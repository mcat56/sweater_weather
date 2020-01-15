class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      render status: :bad_request,  json: ErrorSerializer.new(Error.new('No account found'))
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      render status: :ok, json: ApiKeySerializer.new(ApiKey.new(user.api_key))
    else
      render status: :bad_request,  json: ErrorSerializer.new(Error.new('Please enter valid credentials'))
    end
  end
end
