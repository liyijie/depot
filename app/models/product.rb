class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  attr_accessible :description, :image_url, :price, :title
  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price, :greater_than_or_equal_to => 0.01
  validates_uniqueness_of :title
  validates_format_of :image_url, 
                      :with => /\.(gif|jpg|png)$/i, 
                      :message => "must be a URL for GIF, JPG or PNG image"
	private

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end                    
end
