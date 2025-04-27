#Take array of stock prices, one for each day.
#Return best day to buy and best day for sell.
#Need to buy before you sell. Minimal price day could be AFTER most profitable day.
#
#Pseudocode
#Find minimal price
#Check the largest price behind
#Save profit.
#Save index for minimum day and maximum day
#Find next most low price
#Check the largest price behind.
#Compare this to saved profit
  #IF new_profit > saved_profit THEN overwrite index for minimum day and maximum day
  #Else continue
#Return minimum and maximum days like an array.

def stock_picker(stonks)
  sorted_stonks = stonks.sort
  profit = 0
  profit_days = []
  sorted_stonks.each do |min_price|
    ref_index = 0
    stonks.each_with_index do |price, index|
      if min_price == price
        ref_index = index
        break
      end      
    end
    stonks.each_with_index do |price, index|
      if price > min_price && (price - min_price) > profit && index > ref_index
        profit = price - min_price
        profit_days = [ref_index, index]
      end
    end
  end
  puts "for a profit of $#{stonks[profit_days[1]]} - $#{stonks[profit_days[0]]} == $#{profit}"
  return profit_days
end