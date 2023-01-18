$dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring(word)
    substring_hash = {}
    to_check = word.downcase.split
    $dictionary.each do 
        |dictionary_word|
        substring_hash[dictionary_word] = 0
    end
    $dictionary.each do 
        |dictionary_word|
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

 substring("Howdy partner, sit down! How's it going?")