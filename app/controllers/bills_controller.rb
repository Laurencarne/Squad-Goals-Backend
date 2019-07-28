class BillsController < ApplicationController
  before_action :validate_flat

  def create
    bill = Bill.create(bill_params)

    render json: bill, except: [:created_at, :updated_at],
      include: [
        {
          :bill_splits => {
            except: [:created_at, :updated_at]
          }
        }
      ]
  end

  private
  def bill_params
    params[:bill][:flatmate_ids] ||= []
    params.require(:bill).permit(:name, :title, :desc, :flatmate_id, :total, flatmate_ids: [:bill_id, :flatmate_id, :total_owed, :paid])
  end


end
