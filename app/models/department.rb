class Department < ApplicationRecord
  belongs_to :head, class_name: "User"
end
