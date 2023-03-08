class Hangman
    attr_reader :word
    @word
    @number_of_guesses
    @user_input
    @input_array
    @word_array
    @no_letters
    @win
    @word_switch

    def set_word
        @word = get_random_word
        @input_array = []
        @word.length.times do
            @input_array.push('_ ')
        end
        @word_array = @word.split('')
        @number_of_guesses = 10
        @no_letters = []
        @win = false
        @word_switch = false
    end

    def check_value_vars
        puts '############################################################################'
        puts "\tWord : #{@word}"
        puts "\tUser input : #{@user_input}"
        puts "\tNumber of letters : #{@input_array.join}"
        puts "\tWord array : #{@word_array.join}"
        puts "\tNumber of guesses : #{@number_of_guesses}"
        puts "\tArray of no letters : #{@no_letters.join(', ')}"
        puts '############################################################################'
    end

    def play_game
        loop do
            check_value_vars
            check_input
            if win?
                break
            end
        end
    end
    private

# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ON LOAD \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

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

# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\





# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ INPUT \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

    def user_input_helper
        puts 'Enter word or letter'
        word = gets.chomp.downcase
        save_game if word == 'save'
        word
    end

    def  get_user_input
        word = user_input_helper
        while (word.length < 5 && word.length > 1 && word != 'save') do
            puts 'ERROR!!! Please repeat input'
            word = user_input_helper
        end
        word
    end

    def save_game
        @number_of_guesses += 1
        p 'testSave'
    end
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ WIN CONDITION \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

    def win?
        out_of_guesses? || @win
    end

    def out_of_guesses?
        @number_of_guesses <= 0
    end

    def  compare_words?(to_compare)

        if @word_switch
            if to_compare == @word
                @win = true
            else
                @number_of_guesses -= 1
            end
        else
            @win = true if to_compare == @word 
        end
    end

# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ INPUT CHECKS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


    def check_input

        @user_input = get_user_input

        length_of_input = @user_input.length


        if length_of_input == 1 
            @word_switch = false
            one_letter_check(@user_input)
        else
            @word_switch = true
            compare_words?(@user_input)
        end
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
        compare_words?(@input_array.join)
    end

    def  word_length_condition? (word)
        word.length >= 5 && word.length <= 12
    end



# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

end

h = Hangman.new
h.set_word

h.play_game
h.check_value_vars

