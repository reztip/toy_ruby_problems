#!/home/rez/Odin/learnruby/proj1
def stock_picker(prices)
	buy_point = 0
	sell_point = 0
	max_profit = 0
	i = 0
	length = prices.length
	(buy_point...length).each do |index_1|
		(index_1...length).each do |index_2|
		  #puts index_1, index_2
		  if prices[index_2] - prices[index_1] >= max_profit
		  	buy_point = index_1
		  	sell_point = index_2
		  	max_profit = prices[index_2] - prices[index_1]
		  
		  end
		end
	end

	return [buy_point, sell_point]

end
x = [17,3,6,9,15,8,6,1,10]

p stock_picker(x)

p stock_picker([1,1,2])
