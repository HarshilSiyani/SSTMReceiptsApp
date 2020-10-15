class Department < ApplicationRecord
  has_and_belongs_to_many :head, class_name: "User"
  has_many :receipts
end
