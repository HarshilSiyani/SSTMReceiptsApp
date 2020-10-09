class Receipt < ApplicationRecord
  belongs_to :department
  belongs_to :owner, class_name: "User"

  before_create :set_default_status

  validates :amount, :description, :department_id, presence: true

  def set_default_status
    status = "pending"
  end
end
