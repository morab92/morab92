class SandboxController < ApplicationController
 
 def clients
 	@clients = Client.all
 end

def projects
end




  def products
  end
end

def products

	@products_size = Product.where('size=?',"xl")
	@products_price = Product.where('price>=? AND price>=?',40,90)
	@products_avialability = Product.where('products_avialability=?',true)
	@products_price_size_brand = Product.where('price>=? OR size=? OR brand =?',40,"xxl","upton")
	@products_price_below499 	= Product.where('price<=?',499)
	@products_price_below1200 = Product.where('price<=?',1200)
	@category_hash = {}
	if @category_hash has_key? product_category
		@category_hash[product_category].push(product.name)
	else
		@category_hash[product.category] = [product.name]
		end

		@product_order = Product.order(price DESC,name)
end

