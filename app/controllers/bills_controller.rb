class BillsController < ApplicationController
  before_action :validate_flat

  def create
    debugger
    bill = Bill.create(bill_params)

    render json: bill
  end

  private
  def bill_params
    params[:bill][:flatmate_ids] ||= []
    params.require(:bill).permit(:name, :title, :desc, :flatmate_id, :total, flatmate_ids: [:bill_id, :flatmate_id, :total_owed, :paid])
  end


end
