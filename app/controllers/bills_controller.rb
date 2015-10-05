class BillsController < ApplicationController

  def create
    @bill = current_user.bills.new(bill_params)
    if @bill.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Bill was created"
          redirect_to bills_path
        end
        format.js do
          render '/bills/bill.js.erb'
        end
      end
    else
      flash[:error] = "There was an error creating the bill. Please try again."
      redirect_to bills_path
    end
  end

  def update
    @bill = Bill.find(params[:id])
    if @bill.update_attributes(bill_params)
      respond_to do |format|
        format.html do
          flash[:notice] = "Bill was updated"
          redirect_to bills_path
        end
        format.js do
          render '/bills/bill.js.erb'
        end
      end
    else
      flash[:error] = "There was an error updating the bill. Please try again."
      redirect_to bills_path
    end
  end

  def index
    @bills = current_user.bills
  end

  def destroy
    @bill = Bill.find(params[:bill_id])
    if @bill.delete
      render nothing: true
    else
      flash[:error] = "There was an error deleting the bill. Please try again."
      redirect_to bills_path
    end
  end

  private

  def bill_params
    params.permit(
      :title,
      :description,
      :day_of_month,
      :total_amount
      )
  end

end
