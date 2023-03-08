require_relative 'hangman'
require "yaml"

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
      
def save_game(game)
    
    Dir.mkdir('save_games') unless Dir.exists?('save_games')
    puts 'Enter the name of the save'
    save_name = gets.chomp
    File.open("save_games/#{save_name}.yml", "w") do |f|
        f.write YAML.dump(game)
    end
    
end
