dictionary = ["a", "about", "after", "all", "also", "an", "and", "any", "as", "at", "back", "be", "because", "but", "by", "can", "come", "could", "day", "do", "even", "first", "for", "from", "get", "give", "go", "good", "have", "he", "her", "him", "his", "how", "i", "if", "in", "into", "it", "its", "just", "know", "like", "look", "make", "me", "most", "my", "new", "no", "not", "now", "of", "on", "one", "only", "or", "other", "our", "out", "over", "people", "say", "see", "she", "so", "some", "take", "than", "that", "the", "their", "them", "then", "there", "these", "they", "think", "this", "time", "to", "two", "up", "us", "use", "want", "way", "we", "well", "what", "when", "which", "who", "will", "with", "work", "would", "year", "you", "your"]

def substrings (string, dictionary)
    frequencies = Hash.new(0)
    words = string.downcase.split(" ")
    words.map! {|word| word.gsub(/\W.*/, "")}
    dictionary.each do |d|
        words.each do |word|
            frequencies[d] += 1 if word.include?("#{d}")
        end
    end
    p words
    p frequencies
end

puts "Please enter a phrase for which you would like to itemize its common English words"
string = gets.chomp!

substrings(string, dictionary)