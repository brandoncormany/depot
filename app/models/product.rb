class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true 
#  validates_uniqueness_of :title, :case_sensitive => false, :message => 'Try another one dummy'
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)$}i,
    message: 'must be a URL with GIF, JPG or PNG image.'
  }
end
