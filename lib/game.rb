require "yaml"
require_relative "hangman"

def save_game(game)
    dir_name = 'save_games'
    Dir.mkdir(dir_name) unless Dir.exists?(dir_name)
    puts 'Enter the name of the save'
    save_name = gets.chomp
    File.open("#{dir_name}/#{save_name}.yml", "w") do |f|
        f.write YAML.dump(game)
    end
end

def save_helper game
    puts `clear`
    puts "Saving game..."
    save_game(game)
    puts `clear`
    puts 'Game saved! Press any key to continue...'
    gets
    puts `clear`
end

def load_game 
    dir_name = 'save_games'
    unless Dir.exists?(dir_name) || Dir["#{dir_name}/*"].length != 0
        puts "There are no saved games"
        return 
    end
end

load_game
# h1 = Hangman.new
# until h1.over?
#     if h1.check_input == 'save'
#         save_helper(h1)
#         puts "Do you want to continue playing? (y/n)"
#         continue = gets.chomp
#         return if continue.downcase == 'n' || continue.downcase == 'no'
#         puts `clear`
#     end
# end