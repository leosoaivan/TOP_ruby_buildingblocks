def caesar_cipher(string, number)
    alphabet = ('a'..'z').to_a
    capital = ('A'..'Z').to_a

    arr = []
    string.each_char do |c|
        if c.match(/[a-z]/)
            shift = alphabet.index(c).to_i + number
            arr << alphabet[shift % 26]
        elsif c.match(/[A-Z]/)
            shift = capital.index(c).to_i + number
            arr << capital[shift % 26]
        else
            arr << c
        end
    end
    p arr.join("")
end

print "What should be ciphered? "
message_in = gets.chomp

print "What is the shift? "
key_in = gets.chomp.to_i

print "Encrypted Message: "
caesar_cipher(message_in, key_in)
