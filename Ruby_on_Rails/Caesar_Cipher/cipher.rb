def cc(no_cipher, no_of_positions)
    no_cipher_arr = no_cipher.split('')
    capital_letters = [] # Array of indices where letter is capital
    with_cipher = []
    no_cipher_arr.each_with_index do |letter, index|
        if (letter.downcase != letter)
            capital_letters.push(index)
            letter.downcase!
        end
    end
    no_cipher_arr.each do |let|
        with_cipher.push(change(let, no_of_positions))
    end
    with_cipher = with_cipher.flatten
    with_cipher.each_with_index do 
        |val, ind| 
        if capital_letters.include?(ind)
            val.upcase!
        end
    end
    p with_cipher.join
end

def change(letter_to_change, pos)
    letters_string = 'abcdefghijklmnopqrstuvwxyz'
    letters_array = letters_string.split('').reverse
    temp_arr = []
    letters_array.each_with_index do|letter, index| 
         if letter_to_change == letter
            temp_arr.push(letters_array[index - pos])
         end
    end
    if temp_arr.length == 0
        temp_arr.push(letter_to_change)
    end

    temp_arr
end


def call 
    p "Enter string to encript"
    str_to_enc = gets.chomp
    p 'Enter a number of spaces to shift letters'
    spaces = gets.chomp
    p "Your message encripted with #{spaces} shifted is"
    cc(str_to_enc, spaces.to_i)
end

call