$DICTIONARY = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring(word)
    substring_hash = {}
    to_check = word.downcase.split
    $DICTIONARY.each do 
        |dictionary_word|
        substring_hash[dictionary_word] = 0
        to_check.each do
            |word_to_check|
            substring_hash[dictionary_word] += 1 if word_to_check.include?(dictionary_word)
        end
    end
    substring_hash.each do 
        |key, value|
        if value == 0
            substring_hash.delete(key)
        end
    end
    p substring_hash
end

def call 
    p 'Enter word or sentence to check'
    sentence = gets.chomp
    sentence
end

 substring(call)