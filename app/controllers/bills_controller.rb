class BillsController < ApplicationController
  before_action :validate_flat

  def create
    bill = Bill.create(bill_params)
    render json: bill
  end

  private
  def bill_params
    params.require(:bill).permit(:name, :totle, :desc, :flatmate_id)
  end


end
