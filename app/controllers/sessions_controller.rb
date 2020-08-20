class SessionsController < ApplicationController
  
  skip_before_action :require_login, only: :create

  def create
    user = User.valid_login?(params[:email], params[:password])
    if user
      user.regenerate_token
      render json: user.to_json(only: [:id, :email,:name,:phone,:token ,:type])
    else
      render_unauthorized('Incorrect email or password')
    end
  end

  def destroy
    current_user.invalidate_token
    head :ok
  end
end
