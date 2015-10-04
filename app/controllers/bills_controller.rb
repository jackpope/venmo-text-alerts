class BillsController < ApplicationController


  def create
    @bill = current_user.bills.new(bill_params)
    binding.pry
    if @bill.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Bill was created"
          redirect_to bills_path
        end
        format.js do
          render :create_bill
        end
      end
    else
      flash[:error] = "There was an error creating the bill. Please try again."
      redirect_to bills_path
    end
  end

  def update
  end

  def index
    @bills = current_user.bills
  end

  def destroy
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
