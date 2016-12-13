class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews
  accepts_nested_attributes_for :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def sold_out?
    self.quantity == 0
  end

  def review?
    reviews.count > 0
  end

  def average_review
    reviews.inject(0) {|previous, review| review.rating + previous }.to_f / reviews.count
  end

end
