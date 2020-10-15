class ReceiptsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def index
    @receipts = Receipt.all
  end

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
    if @receipt.status == "pending"
      if params[:commit] == "Approve"
        @receipt.status = "approved"
        @receipt.save
      redirect_to department_path(@department)
      elsif params[:commit] == "Reject"
        @receipt.status = "rejected"
        @receipt.save
        redirect_to department_path(@department)
      elsif params[:commit] == "Update Receipt"
        @receipt.update(receipt_params)
        redirect_to department_path(@department)
      else
        @receipt.status = "pending"
        @receipt.save
      end
    else
      if params[:commit] == "Cash"
        @receipt.paid = true
        @receipt.paidby = "Cash"
        @receipt.save
        redirect_to accounts_path
      elsif params[:commit] == "Bank"
        @receipt.paid = true
        @receipt.paidby = "Bank"
        @receipt.save
        redirect_to accounts_path
      else

      end
    end

  end




  private

  def receipt_params
    params.require(:receipt).permit(:amount, :date, :description, :department_id, :owner_id, :status, :paid)
  end

end
