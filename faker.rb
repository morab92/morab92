
require 'faker'

10.times do 

	client = Client.new
	client.name = Faker::Name.name
	client.email = Faker::Internet.email
	client.mobile = Faker::Number.number(10)
	client.company = Faker::Company.name
	client.website = "www.#{Faker::Internet.domain_name}"
	client.save

	
end

50.times do

	project = Project.new
	project.name = Faker::App.name
	project.description = Faker::Lorem.paragraph
	project.start_date = Faker::Date.between(Date.today.beginning_of_year,Date.today)
	project.client_id = Client.all.sample.id
	project.status = ["new","on-going","completed"].sample
	project.save
end


1000.times do

	product = Product.new
	product.name = Faker::Commerce.product_name
	product.price = Faker::Commerce.price(100..10000)
	product.category = ["mens_clothing","womens_clothing","kids_clothing","sports_wear"].sample
	product.discount = [10,20,30].sample
	product.brand = Faker::Company.name
	product.size = ["s","xl","xxl","xxxl","others"].sample
	product.availability = Faker::Boolean.boolean
	product.color = Faker::Color.color_name
	product.save
	
	end
