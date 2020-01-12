class Api::V1::UsersController < AppplicationController

  def create
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end


end
