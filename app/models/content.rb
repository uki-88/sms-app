class Content < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  validates :to_do, presence: true
end
