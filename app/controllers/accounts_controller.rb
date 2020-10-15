class AccountsController < ApplicationController
  def index
    @receipts = Receipt.all
    @receipts_approved = Receipt.where("status = 'approved'")
    @receipts_rejected = Receipt.where("status = 'rejected'")
    @receipts_unpaid = Receipt.where("paid = false AND status = 'approved'")

  end

  def paid
    @receipts = Receipt.where("paid = true")
    total = []
    @sum = 0
    @receipts.each do |receipt|
      total << receipt.amount
    end
    total.each do |amount|
      @sum += amount
    end
  end

end
