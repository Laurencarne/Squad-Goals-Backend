class BillSplitsController < ApplicationController
  before_action :validate_flat

  def create
    bill_split = BillSplit.create(bill_split_params)
    render json: bill_split
  end

  def update
    bills = current_flatmate.bills
    billSplit = current_flatmate.bill_splits.select { |bs| bs.id === params[:id].to_i}
    if billSplit.length > 0
      billSplit[0].update(bill_split_params)
      render json: bills, except: [:created_at, :updated_at],
        include: [
          {
            :bill_splits => {
              except: [:created_at, :updated_at]
            }
          }
        ]
    else
      render json: {error: "Data Not Avaliable"}
    end
  end

  private
  def bill_split_params
    params.require(:bill_split).permit(:bill_id, :flatmate_id, :total_owed, :paid)
  end
end
