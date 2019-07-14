class ApplicationController < ActionController::API
  
  def issue_token(payload)
    JWT.encode(payload, ENV['RAILS_SECRET'])
  end

  def decode_token(token)
    JWT.decode(token, ENV['RAILS_SECRET'])[0]
  end

  def get_token
    request.headers["Authorization"]
  end

  def current_flatmate
    token = get_token
    decoded_token = decode_token(token)
    flatmate = Flatmate.find(decoded_token["flatmate_id"])
    flatmate_hash = {
      username: flatmate[:username],
      id: flatmate[:id],
      first_name: flatmate[:first_name],
      last_name: flatmate[:last_name],
      birthday: flatmate[:birthday],
      move_in: flatmate[:move_in],
      rent_due: flatmate[:rent_due],
      water_due: flatmate[:water_due],
      electricity_due: flatmate[:electricity_due],
      gas_due: flatmate[:gas_due]
    }
  end

  def logged_in
    !!current_flatmate
  end
end
