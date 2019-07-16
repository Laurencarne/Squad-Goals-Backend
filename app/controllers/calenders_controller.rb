class CalendersController < ApplicationController

private
  def calender_params
    params.require(:calender).permit(:flat_id)
  end
end
