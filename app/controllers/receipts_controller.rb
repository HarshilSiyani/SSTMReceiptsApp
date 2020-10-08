class ReceiptsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
    @receipt = Receipt.new
    @departments = Department.all

  end

  def create
    @receipt = Receipt.new(receipt_params)
    @departments = Department.all
    if @receipt.save

      redirect_to root_path
    else
      raise
      render :new
    end
  end

  def show
    @receipt = Receipt.find(params[:id])
    @department = Department.find(params[:department_id])
  end

  def edit
    @receipt = Receipt.find(params[:id])
    @department = Department.find(params[:department_id])
  end

  def update
    @receipt = Receipt.find(params[:id])
    @department = Department.find(params[:department_id])
    if params[:commit] == "Approve"
      @receipt.status = "approved"
      @receipt.save
    redirect_to department_path(@department)
    else params[:commit] == "Reject"
      @receipt.status = "rejected"
      @receipt.save
      redirect_to department_path(@department)
    end

  end

  def modify

    if params[:value] == "approve"
      approve_receipt(@receipt)
    elsif params[:my_action] == "decline"
      decline_receipt(@receipt)
    else
      redirect_to root_path
    end

  end



  private

  def receipt_params
    params.require(:receipt).permit(:amount, :date, :description, :department_id, :owner_id, :status)
  end

  def approve_receipt(receipt)
    if receipt.approved
      message = "Receipt approved and sent to accounts"
      receipt.status = 'approved'
      redirect_to department_path(@department)
    else
      message = "Receipt approval failed"
      raise
    end
  end
end
