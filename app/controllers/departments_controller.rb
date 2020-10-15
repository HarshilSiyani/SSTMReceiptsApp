class DepartmentsController < ApplicationController

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to department_path(@department)
    else
      render :new
    end
  end

  def show
    # find department id from the params to show the page of selected
    @department = Department.find(params[:id])

    # shows pending receipts of the selected department
    @receipts_pending = Receipt.where("status = 'pending' AND department_id = #{@department.id}")

    @receipts_approved = Receipt.where("status = 'approved' AND department_id = #{@department.id}")
    @receipts_rejected = Receipt.where("status = 'rejected' AND department_id = #{@department.id}")

    # @receipt = Receipt.find
  end

  def approved_receipts
    @department = Department.find(params[:id])
    @receipts_approved = Receipt.where("status = 'approved' AND department_id = #{@department.id}")
  end

  def rejected_receipts
    @department = Department.find(params[:id])
    @receipts_rejected = Receipt.where("status = 'rejected' AND department_id = #{@department.id}")
  end

  def edit

    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:department_id])
    @receipt.update(receipt_params)

  end


  private

  def department_params
    params.require(:department).permit(:name, :head_id)
  end
end
