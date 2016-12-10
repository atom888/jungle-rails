class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def sold_out?
    # puts "this is a #{self.name} and it has #{self.quantity}, so its soldoutness is #{self.quantity==0}"
    self.quantity == 0
  end

end
