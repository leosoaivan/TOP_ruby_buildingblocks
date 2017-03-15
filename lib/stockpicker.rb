class StockAnalyzer
  attr_reader :stocks, :max_profit, :best_index
  attr_writer :max_profit
  
  def initialize(stocks)
    @stocks = stocks
    @max_profit = 0
    @best_index = { buy: 0, sell: 0 }
  end
  
  def results
    analyze
    output_message
  end

  private

    def analyze
      stocks.each_with_index do |buy_price, buy_ind|
        stocks.each_with_index do |sell_price, sell_ind|
          profit = sell_price - buy_price
          if profit > self.max_profit && sell_ind > buy_ind
            self.max_profit = profit
            set_best_index(buy_ind, sell_ind)
          end
        end
      end
    end

    def set_best_index(buy, sell)
      best_index[:buy] = buy
      best_index[:sell] = sell
    end

    def output_message
      puts "The best day to buy is day #{best_index[:buy] + 1}, and"
      puts "The best day to sell is day #{best_index[:sell] + 1}."
    end
end

class StockSanitizer
  attr_reader :stocks

  def initialize(stocks)
    @stocks = stocks
  end
  
  def sanitize
    stocks.gsub(/[^0-9\s]/, "").split(" ").map! { |x| x.to_i }
  end
end

def script
  print "Enter stock prices in chronological order: "
  stocks = gets.chomp

  sanitized_stocks = StockSanitizer.new(stocks).sanitize

  StockAnalyzer.new(sanitized_stocks).results
end

script