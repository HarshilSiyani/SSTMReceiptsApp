class Receipt < ApplicationRecord
  belongs_to :department
  belongs_to :owner, class_name: "User"

  before_create :set_default_status, :set_default_paid

  validates :amount, :description, :department_id, presence: true

  def set_default_status
    status = "pending"
  end

  def set_default_paid
    paid = false
  end
end
