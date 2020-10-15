class Account < ApplicationRecord
  belongs_to :user
  has_many :departments

  include PgSearch::Model
  pg_search_scope :department_search, associated_against: {
    departments: [:name]
  }
end
