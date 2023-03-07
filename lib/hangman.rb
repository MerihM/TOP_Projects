def word_length_condition? (word)
    word.length >= 5 && word.length <= 12 
end

def load_words
    content = File.open('google_10000_english.txt')
    arr_of_words = []
    while !content.eof?
        line = content.readline.strip
        arr_of_words.push(line) if word_length_condition?(line)
    end
    arr_of_words
end

def get_user_input
    puts 'Enter some word'
    word = gets.chomp.downcase
    word
end


