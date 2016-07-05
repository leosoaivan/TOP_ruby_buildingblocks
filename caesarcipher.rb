def caesar_cipher(string, number)
    arr = []
    string.each_char do |c|
        shift = c.ord + number
        if c.match(/[a-z]/)
            if shift < 122 ? arr << shift.chr : arr << (shift - 26).chr
            end
        elsif c.match(/[A-Z]/)
            if shift < 90 ? arr << shift.chr : arr << (shift - 26).chr
            end
        else
            arr << c
        end
    end
    p arr.join("")
end

#Courtesy of https://github.com/j-campbell
print "What should be ciphered? "
user_string = gets.chomp

print "What is the shift? "
user_number = gets.chomp.to_i

print "Encrypted Message: "
caesar_cipher(user_string, user_number)
