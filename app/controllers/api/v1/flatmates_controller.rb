class Api::V1::FlatmatesController < ApplicationController

  def index
    flatmates = []
    Flatmate.all.each do |flatmate|
      flatmate_hash = {
        username: flatmate[:username],
        first_name: flatmate[:first_name],
        last_name: flatmate[:last_name],
        email: flatmate[:email],
        birthday: flatmate[:birthday],
        move_in: flatmate[:move_in],
        rent_due: flatmate[:rent_due],
        electricity_due: flatmate[:electricity_due],
        water_due: flatmate[:water_due],
        gas_due: flatmate[:gas_due],
        id: flatmate[:id]
      }
      flatmates << flatmate_hash
    end
    render json: flatmates
  end

  def create
    flatmate = Flatmate.new(flatmate_params)
    flatmate.save
      if flatmate.save
        payload = {flatmate_id: flatmate.id}
        token = issue_token(payload)
        render json: { jwt: token }
      else
        render json: {error: "Signup not successful!"}
    end
  end

  def update
    flatmate = Flatmate.find_by(id: params[:id])
      if flatmate.update(flatmate_params)
        flatmate = {
          username: flatmate[:username],
          first_name: flatmate[:first_name],
          last_name: flatmate[:last_name],
          birthday: flatmate[:birthday],
          move_in: flatmate[:move_in],
          rent_due: flatmate[:rent_due],
          electricity_due: flatmate[:electricity_due],
          water_due: flatmate[:water_due],
          gas_due: flatmate[:gas_due],
          id: flatmate[:id]
        }
      render json: flatmate
    else
      render json: {error: 'Profile not updated'}
    end
  end

  private
  def flatmate_params
    params.require(:flatmate).permit(:username, :first_name, :last_name, :email, :password, :birthday, :move_in, :rent_due, :water_due, :electricity_due, :gas_due)
  end

end
