class Receipt < ApplicationRecord
  belongs_to :department

  before_create :set_default_status

  def set_default_status
    status = "pending"
  end
end
