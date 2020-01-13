class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      render status: :bad_request, body: user.errors.full_messages.to_sentence
    elsif user.authenticate(params[:password])
      render status: :ok, body: { api_key: "#{user.api_key}" }.to_json
    end
  end


end
