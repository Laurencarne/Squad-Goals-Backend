class BillSplitsController < ApplicationController
  before_action :validate_flat

  def create
    bill_split = BillSplit.create(bill_split_params)
    render json: bill_split
  end

  private
  def bill_split_params
    params.require(:bill_split).permit(:bill_id, :flatmate_id, :total_owed, :paid)
  end
end
