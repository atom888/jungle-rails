class Review < ActiveRecord::Base

  belongs_to :product, required: true
  belongs_to :user

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }




end
