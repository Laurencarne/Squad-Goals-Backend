class ShoppingListsController < ApplicationController

private
  def shoppinglist_params
    params.require(:shoppinglist).permit(:flat_id)
  end
end
