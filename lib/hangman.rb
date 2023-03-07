class Hangman
    attr_reader :word
    @word
    @user_input
    @input_array

    def set_word
        @word = get_random_word
        @input_array = []
        @word.length.times do
            @input_array.push('_ ')
        end
    end

    def check_value_vars
        p "Word : #{@word}"
        p "User input : #{@user_input}"
        p "Number of letters : #{@input_array}"
    end
    def play_round
        check_input
    end
    private 

    def  compare_words?
        p @user_input
        p @word
        p @user_input == @word
    end

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

    def one_letter_check
        p 'test'
    end

    def save_game
        p 'testSave'
    end
    def check_input

        @user_input = get_user_input
        length_of_input = @user_input.length

        case length_of_input
        when 1 then one_letter_check
            
        when 4 then save_game
            
        else compare_words?
            
        end
    end
end

h = Hangman.new
h.set_word

p h.word
h.play_round
h.check_value_vars

