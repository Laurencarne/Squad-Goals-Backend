class ApplicationController < ActionController::API

  def issue_token(payload)
    JWT.encode(payload, ENV['RAILS_SECRET'])
  end

  def decode_token(token)
    begin
      JWT.decode(token, ENV['RAILS_SECRET'])[0]
    rescue
      false
    end
  end

  def get_token
    request.headers["Authorization"]

  end

  def current_flatmate
    token = get_token
    decoded_token = decode_token(token)
    if decoded_token
      flatmate = Flatmate.find(decoded_token["flatmate_id"])
    else
      false
    end
  end

  def logged_in
    !!current_flatmate
  end

  def validate_logged_in
    if !logged_in
      render json: {error: "Data Not Avaliable"}
    end
  end

  def has_flat
    logged_in && current_flatmate.flat_id
  end

  def validate_flat
    if !has_flat
      render json: {error: "Data Not Avaliable"}
    end
  end

end
