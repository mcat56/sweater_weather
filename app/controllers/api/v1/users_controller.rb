class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render status: :created, json: ApiKeySerializer.new(ApiKey.new(user.api_key))
    else
      render status: :bad_request, json: ErrorSerializer.new(Error.new(user.errors.full_messages.to_sentence))
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
