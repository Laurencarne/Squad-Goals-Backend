class ItemsController < ApplicationController
  before_action :validate_flat

  # def index
  #   item = Flatmate.find(current_flatmate[:id]).flat.items
  #   render json: item, except: [:created_at, :updated_at, :shopping_list_id]
  # end
  #
  # def show
  #   flatmate = current_flatmate
  #   item = Item.find_by(id: params[:id])
  #   if flatmate.flat_id === item.shopping_list.flat_id
  #     render json: item, except: [:created_at, :updated_at, :shopping_list_id]
  #   else
  #     render json: {error: "Data Not Avaliable"}
  #   end
  # end

  def create
    item = Item.create(item_params)
    render json: item
  end

  # def update
  #   item = current_flatmate.items.select { |item| item.id === params[:id] }
  #   if item.length > 0
  #     item[0].update(item_params)
  #     render json: item
  #   else
  #     render json: {error: "Update Unsuccessful"}
  #   end
  # end

  def destroy
    item = current_flatmate.items.select { |item| item.id === params[:id].to_i }
    if item.length > 0
      item[0].destroy
      render json: {message: "Item Successfully Deleted"}
    else
      render json: {error: "Delete Unsuccessful"}
    end
  end

private
  def item_params
    params.require(:item).permit(:shopping_list_id, :name)
  end
end
