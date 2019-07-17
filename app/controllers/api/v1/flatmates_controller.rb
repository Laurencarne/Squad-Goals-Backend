class Api::V1::FlatmatesController < ApplicationController
  before_action :validate_logged_in, except: [:create]

  def create
    flatmate = Flatmate.new(flatmate_params)
      if flatmate.save
        payload = {flatmate_id: flatmate.id}
        token = issue_token(payload)
        render json: { jwt: token }
      else
        render json: {error: "Signup not successful!"}
    end
  end

  def update
    if current_flatmate.id === params[:id].to_i
      current_flatmate.update(flatmate_params)
      render json: current_flatmate, except: [:created_at, :updated_at, :password_digest, :email]
    else
      render json: {error: "Data Not Avaliable"}
    end
  end

  private
  def flatmate_params
    params.require(:flatmate).permit(:username, :avatar, :first_name, :last_name, :email, :password, :birthday, :move_in, :rent_due, :water_due, :electricity_due, :gas_due)
  end

end
