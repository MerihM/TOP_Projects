require_relative 'hangman'

def user_input_helper

    puts 'Enter word or letter'
    h.word = gets.chomp.downcase
    save_game if h.word == 'save'
    h.word
    
end
        
def get_user_input
    
    word = user_input_helper
    while (word.length < 5 && word.length > 1 && word != 'save') do
        puts `clear`
        puts 'ERROR!!! Please repeat input'
        h.word = user_input_helper
    end
    word
    
end
      
def save_game
    
    @number_of_guesses += 1
    Dir.mkdir('save_games') unless Dir.exists?('save_games')
    
end
