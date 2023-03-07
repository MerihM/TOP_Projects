class Hangman
    attr_reader :word
    @word

    def set_word
        @word = get_random_word
    end

    private 

    def  word_length_condition? (word)
        word.length >= 5 && word.length <= 12
    end

    def  load_words
        content = File.open('google_10000_english.txt')
        arr_of_words = []
        while !content.eof?
            line = content.readline.strip
            arr_of_words.push(line) if word_length_condition?(line)
        end
        arr_of_words
    end

    def  get_random_word
        load_words[rand(0..load_words.length)]
    end

    def  get_user_input
        puts 'Enter some word'
        word = gets.chomp.downcase
    end

    def  compare_words?
        get_user_input == @word
    end
    
end

h = Hangman.new
h.set_word
p h.word

