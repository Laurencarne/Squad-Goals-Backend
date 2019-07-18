class FlatsController < ApplicationController
  before_action :validate_flat, except: [:create]

  def my_flat
    flat = Flatmate.find(current_flatmate[:id]).flat
      render json: flat, except: [:updated_at, :created_at]
  end

  def create
    if logged_in && !current_flatmate.flat_id
      flat = Flat.new(flat_params)
      if flat.save
        current_flatmate.update(flat_id: flat.id)
        Calender.create(flat_id: flat.id, id: flat.id)
        ShoppingList.create(flat_id: flat.id, id: flat.id)
        render json: flat
      else
        render json: {error: "Flat not created."}
      end
    end
  end

  def update
    flat = current_flatmate.flat
    if flat
      flat.update(flat_params)
      render json: flat
    else
      render json: {error: "Update Unsuccessful"}
    end
  end

  def destroy
    flat = current_flatmate.flat
    if flat
      flat.destroy
      current_flatmate.update(flat_id: nil)
      render json: {message: "Flat Successfully Deleted"}
    else
      render json: {error: "Delete Unsuccessful"}
    end
  end

private

  def flat_params
    params.require(:flat).permit(:name, :flat_key, :address_one, :address_two, :city, :postcode)
  end

end
