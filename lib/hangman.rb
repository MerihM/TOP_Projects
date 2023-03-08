require "yaml"

class Hangman
    attr_accessor :word
    @word
    @number_of_guesses
    @user_input
    @input_array
    @word_array
    @no_letters
    @win
    @word_switch

    def initialize
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

    def play_game
        loop do
            puts `clear`
            progress_tracking
            check_input
            if win?
                puts `clear`
                break
            end
        end
    end
    private

    def progress_tracking
        puts "\tWord : #{@input_array.join}\n\n"
        puts "\tGuesses left : #{@number_of_guesses}\n\n"
        puts "\tThere are no  : #{@no_letters.join(', ')} letters\n\n" if @no_letters.length > 0
    end

# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ON LOAD \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

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


# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ WIN CONDITION \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

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

# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ INPUT CHECKS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

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

end


# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ END OF CLASS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


def user_input_helper (game)

    puts 'Enter word or letter'
    word = gets.chomp.downcase
    save_game(game) if word == 'save'
    word
    
end
        
def get_user_input (game)
    
    word = user_input_helper(game)
    while (word.length < 5 && word.length > 1 && word != 'save') do
        puts `clear`
        puts 'ERROR!!! Please repeat input'
        word = user_input_helper(game)
    end
    word
    
end
      
def save_game(game)
    
    dir_name = 'save_games'
    Dir.mkdir(dir_name) unless Dir.exists?(dir_name)
    no_of_saves = Dir.glob("#{dir_name}/*.{yml}").length
    puts 'Enter the name of the save'
    save_name = gets.chomp
    File.open("#{dir_name}/#{no_of_saves + 1}. #{save_name}.yml", "w") do |f|
        f.write YAML.dump(game)
    end
    
end

def load_game
    dir_name = 'save_games/'
    arr = Dir.glob("#{dir_name}*.{yml}")
    arr = arr.each {|m| m.slice!(dir_name)}
    puts arr
    puts "Select save game by entering number next to it"
    select = gets.chomp
    while select.to_i == 0 || select.to_i > arr.length
        puts `clear`
        puts "ERROR! Please repeat selection"
        puts arr
        select = gets.chomp
    end
    puts arr[select.to_i-1]
    file = File.open("#{dir_name}#{arr[select.to_i-1]}", "r")
end


h = YAML.load(load_game)


