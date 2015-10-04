class CopayersController < ApplicationController

  def create
    @bill = Bill.find(params[:bill_id])
    @copayer = @bill.copayers.new(copayer_params)
    if @copayer.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Copayer was created"
          redirect_to bills_path
        end
        format.js do
          render '/bills/create_copayer.js.erb'
        end
      end
    else
      flash[:error] = "There was an error creating the copayer. Please try again."
      redirect_to bills_path
    end
  end

  def update
    @copayer = Copayer.find(params[:id])
    if @copayer.update_attributes(copayer_params)
      respond_to do |format|
        format.html do
          flash[:notice] = "Copayer was updated"
          redirect_to bills_path
        end
        format.js do
          render '/bills/update_copayer.js.erb'
        end
      end
    else
      flash[:error] = "There was an error updating the copayer. Please try again."
      redirect_to bills_path
    end
  end

  def destroy
    @copayer = Copayer.find(params[:copayer_id])
    if @copayer.delete
      render nothing: true
    else
      flash[:error] = "There was a problem deleting the copayer. Please try again."
      redirect_to bills_path
    end
  end

  private

  def copayer_params
    params.permit(
      :first_name,
      :last_name,
      :phone_number,
      :amount
      )
  end
  
end