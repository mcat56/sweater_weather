class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render status: :created, body: { api_key: "#{user.api_key}" }.to_json
    else
      render status: :bad_request, body: user.errors.full_messages.to_sentence
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
