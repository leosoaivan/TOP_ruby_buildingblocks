require 'stockpicker'

describe StockSanitizer do
  let (:stocksanitizer) {StockSanitizer.new('[1, 2, 3, 4, 5]')}

  describe '#sanitize' do
    it 'returns an array of numbers from a string' do
      expect(stocksanitizer.sanitize).to eql ([1, 2, 3, 4, 5])
    end
  end
end

describe StockAnalyzer do 
  let (:stockanalyzer) {StockAnalyzer.new([17, 3, 6, 9, 15, 3, 17, 17])}

  describe '#results' do 
    it 'returns a pair of index with the best day to buy/sell' do 
      expect(stockanalyzer.results).to eql([1, 6])
    end
  end

# Private methods[17]

  # describe '#analyze' do 
  #   it 'returns a pair of index with the best day to buy/sell' do 
  #     expect{stockanalyzer.analyze}.to change(stockanalyzer, :best_index). from({buy: 0, sell: 0}).to({buy: 1, sell: 6})
  #   end
  # end

end

  
