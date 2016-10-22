def stockpicker(array)
    best_days = []
    highest_profit = 0
    array.each do |a|
        array[array.index(a)..-1].each do |b|
            possible_profit = b - a
            if possible_profit > highest_profit
                highest_profit = possible_profit
                best_days = [array.index(a), array.index(b)]
            end
        end
    end
    puts "Buy on day #{best_days[0]} at $#{array[best_days[0]]} and sell on day #{best_days[1]} at $#{array[best_days[1]]} for maximum profit of $#{highest_profit}."
end

puts "Please enter stock price in chronological order, separated by a comma:"
array = gets.chomp.split(",").map{|price| price.to_i}

puts stockpicker(array)
