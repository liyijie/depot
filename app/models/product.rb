class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price, :greater_than_or_equal_to => 0.01
  validates_uniqueness_of :title
  validates_format_of :image_url, 
  					   :with => /\.(gif|jpg|png)$/i, 
  					   :message => "must be a URL for GIF, JPG or PNG image"
end
