require 'spec_helper'

describe Product do
  it "should check the attribute validation" do
  	product = Product.new(:title => "test", :description => "yyy")
  	product.should_not be_valid
  	
  	product.image_url = "test.gif"
  	product.price = -1
  	product.should_not be_valid

  	product.price = 0
  	product.should_not be_valid

  	product.price = 5
  	product.should be_valid
  end
end
