class Hangman

    @word
    @number_of_guesses
    @user_input
    @input_array
    @word_array
    @no_letters 

    def set_word
        @word = get_random_word
        @input_array = []
        @word.length.times do
            @input_array.push('_ ')
        end
        @word_array = @word.split('')
        @number_of_guesses = 10
        @no_letters = []
    end

    def check_value_vars
        puts "Word : #{@word}"
        puts "User input : #{@user_input}"
        puts "Number of letters : #{@input_array.join}"
        puts "Word array : #{@word_array.join}"
        puts "Number of guesses : #{@number_of_guesses}"
        puts "Array of no letters : #{@no_letters.join(', ')}"
    end

    def play_game
        until out_of_guesses?
            check_input
        end
    end
    private 

    def out_of_guesses?
        @number_of_guesses == 0
    end

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
            if @no_letters.include?(letter)
                @number_of_guesses -= 1
            else
                @no_letters.push(letter)
                @number_of_guesses -= 1        
            end
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
        length_of_input = @user_input.length

        case length_of_input

        when 1 then one_letter_check (@user_input)
                        
        else compare_words?
            
        end
    end
end

h = Hangman.new
h.set_word

h.play_game
h.check_value_vars

