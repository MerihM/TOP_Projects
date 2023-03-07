class Hangman
    attr_reader :word
    @word
    @number_of_guesses
    @user_input
    @input_array
    @word_array

    def set_word
        @word = get_random_word
        @input_array = []
        @word.length.times do
            @input_array.push('_ ')
        end
        @word_array = @word.split('')
        @number_of_guesses = 10
    end

    def check_value_vars
        p "Word : #{@word}"
        p "User input : #{@user_input}"
        p "Number of letters : #{@input_array}"
        p "Word array : #{@word_array}"
        p "Number of guesses : #{@number_of_guesses}"
    end

    def play_round
        check_input
    end
    private 

    def  compare_words?
        @user_input == @word
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
        while (word.length < 4 && word.length > 1) do
            puts 'ERROR!!! Please repeat input'
            word = gets.chomp.downcase
        end
        word
    end

    def one_letter_check (letter)
        if @word_array.include?(letter) 
            @word_array.each_with_index do
                |l, index|
                @input_array[index] = letter if l == letter
            end
        else 
            @number_of_guesses -= 1
        end

    end
    def save_game
        p 'testSave'
    end
    def check_input

        @user_input = get_user_input
        if @user_input == 'save'
            save_game 
            return
        end
        p 'No save'
        length_of_input = @user_input.length

        case length_of_input
        when 1 then one_letter_check (@user_input)
                        
        else compare_words?
            
        end
    end
end

h = Hangman.new
h.set_word

p h.word
h.play_round
h.check_value_vars

