require "yaml"
require_relative "hangman"

def save_game(game)
    dir_name = 'save_games'
    Dir.mkdir(dir_name) unless Dir.exists?(dir_name)
    puts 'Enter the name of the save'
    save_name = gets.chomp
    File.open("#{dir_name}/#{save_name}.yaml", "w") do |f|
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

def choose_save 
    dir_name = 'save_games'
    unless Dir.exists?(dir_name) && Dir["#{dir_name}/*"].length != 0
        puts "There are no saved games"
        return 
    end
    filenames = Dir.glob("#{dir_name}/*").map { |file| file[(file.index('/') + 1)...(file.index('.'))] }
    puts "Choose saved game"
    puts filenames
    begin
        fn = gets.chomp
        raise "#{fn} doesn't exist" unless filenames.include?(fn)
        puts "Loading #{fn}...\n"
        "#{dir_name}/#{fn}.yaml"
    rescue StandardError => e
        puts e
        retry
    end
end

def load_game 
    fn = choose_save
    return if fn == nil
    saved = File.open(File.join(Dir.pwd, fn), 'r')
    loaded_game = YAML.unsafe_load(saved)
    saved.close
    puts loaded_game
end
