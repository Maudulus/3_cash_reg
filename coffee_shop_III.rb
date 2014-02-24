require 'csv'
require 'Date'
 
def reports(date_range_start, date_range_finish)
	date_range_start = data[]	
end



def receipt (amount_tendered,totals)
  			if amount_tendered <= totals[0]
    			puts "You owe me an additional #{formatter(total_owed - amount_tendered)} or I will break your kneecaps." # this one - the formatting part - this is used twice
  			else
		    puts "===Thank You!==="
		    puts "The total change due is #{(amount_tendered - totals[0])}"
		    puts "Transaction completed on #{normal_time}"
		    puts "================"
		  end
		end

def normal_time
  Time.now.strftime("%m/%d/%Y %I:%M%p")
end
 
 # collects the data from the CSV and stores it into an array of hashes
 data = []
 CSV.foreach('products.csv', headers: true) do |row|
 	data << row.to_hash
 end 
	# data = 	[
	# 	data[0]		{"SKU" => 120945, "name" => Light, "wholesale_price" => 2.50, "retail_price" => 5}
	# 	data[1]		{679340,Medium,3.25,7.50}
	# 	data[2]		{328745,Bold,4.75,9.75}
	# 
#puts (data[0]["retail_price"]).to_i * 3
 
 
 	
		totals = []
 
	def price_calculator(customer_selection, quantity, data, totals)
		#while switch = true 
		light = 0 
		medium = 0
		bold = 0
		
		

		if customer_selection == 1
			totals << ((data[0]["retail_price"]).to_f * quantity)
			light += 1
			CSV.open('past_orders.csv', "a+") do |row|
 			row << [Time.now.strftime("%m/%d/%Y"), data[0]["SKU"] , quantity]	
			end 
		elsif customer_selection == 2
			totals << ((data[1]["retail_price"]).to_f * quantity)
			medium += 1	
			CSV.open('past_orders.csv', "a+") do |row|
 			row << [Time.now.strftime("%m/%d/%Y"), data[1]["SKU"] , quantity]	
			end 
		elsif customer_selection == 3 
			totals << ((data[2]["retail_price"]).to_f * quantity) 
			bold +=1
			CSV.open('past_orders.csv', "a+") do |row|
 			row << [Time.now.strftime("%m/%d/%Y"), data[2]["SKU"] , quantity]	
			end 
		elsif customer_selection == 4
			puts "What is the amount tendered?"
			print '>'
			amount_tendered = gets.rstrip.to_f
			receipt(amount_tendered, totals)

		elsif customer_selection == 5 
			puts "What Date Range Would You Like the Report For? (MM/DD/YYYY) "
			puts "Start Date"
			date_range_start = gets.chomp
			puts "End Date" 
			date_range_finish = gets.chomp
		else puts "Please enter an approved selection (1-5). "
		end
		totals = totals.inject{|sum,x| sum + x }
		puts "Subtotal: $#{totals}"
	end
 
#need to select the price from the DATA array and multiply it by the line number
 
 
puts "Welcome to Brutus' coffee emporium!"
 
puts "1) Add item - $5.00 - Light"
puts "2) Add item - $7.50 - Medium"
puts "3) Add item - $9.75 - Bold"
puts "4) Complete Sale"
puts "5) Reporting"
 
puts 
 
 
 
switch = true 
 
 
 
while switch  
	print "Please make a selection: "
 
	customer_selection = gets.chomp.to_i
	
	# if customer_selection == 4
	# 	break 
	if customer_selection == 5
		quantity = 1
	elsif customer_selection == 4
		""
	else  
		print "How many would you like? "
		quantity = gets.chomp.to_i
	end 
		
 
 
price_calculator(customer_selection, quantity, data, totals)
	if customer_selection == 4
		break 
	end 
end 
 
 

 
CSV.foreach('past_orders.csv', headers: false) do |row|
 	puts row 
end 
 





puts "===Sale Complete==="

