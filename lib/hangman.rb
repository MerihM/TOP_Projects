def word_length_condition? (word)
    word.length >= 5 && word.length <= 12 
end

content = File.open('google_10000_english.txt')
arr_of_words = []
while !content.eof?
    line = content.readline.strip
    arr_of_words.push(line) if word_length_condition?(line)
end