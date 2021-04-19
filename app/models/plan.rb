class Plan < ApplicationRecord
  has_many :plan_users, dependent: :destroy
  has_many :users, through: :plan_users
  has_many :contents, dependent: :destroy

  validates :title, presence: true
end
