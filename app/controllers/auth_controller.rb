class AuthController < ApplicationController

  def create
  flatmate = Flatmate.find_by(username: params[:username])
  if flatmate && flatmate.authenticate(params[:password])
    payload = {flatmate_id: flatmate.id}
    token = issue_token(payload)
    render json: { jwt: token, user: flatmate.username}
  else
    render json: { error: "The token couldn't be created. Login failed."}
  end
end

def show
  if logged_in
    render json: current_flatmate
  else
    render json: {error: "Incorrect token."}
  end
end
end
