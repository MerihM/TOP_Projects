require "yaml"
require "class_hangman.rb"

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

def chose_game

end
def load_game

end

h1 = Hangman.new
until h1.over?
    p 'save game' if check_input == 'save'
end