require "yaml"
require_relative "hangman"

def save_game(game)
    dir_name = 'save_games'
    Dir.mkdir(dir_name) unless Dir.exists?(dir_name)
    puts 'Enter the name of the save\n'
    save_name = gets.chomp
    File.open("#{dir_name}/#{save_name}.yaml", "w") do |f|
        f.write YAML.dump(game)
    end
end

def save_helper game
    puts `clear`
    puts "Saving game...\n"
    save_game(game)
    puts `clear`
    puts 'Game saved! Press any key to continue...\n'
    gets
    puts `clear`
    puts "Do you want to continue playing? (y/n)\n"
    continue = gets.chomp
    return continue
end

def choose_save 
    dir_name = 'save_games'
    unless Dir.exists?(dir_name) && Dir["#{dir_name}/*"].length != 0
        puts "There are no saved games\n"
        return 
    end
    filenames = Dir.glob("#{dir_name}/*").map { |file| file[(file.index('/') + 1)...(file.index('.'))] }
    puts "Choose saved game"
    puts filenames
    begin
        fn = gets.chomp
        raise "#{fn} doesn't exist\n" unless filenames.include?(fn)
        puts "Loading #{fn}...\n"
        "#{dir_name}/#{fn}.yaml"
    rescue StandardError => e
        puts `clear`
        puts e
        puts "Choose saved game\n"
        puts filenames
        retry
    end
end

def load_game 
    fn = choose_save
    return if fn == nil
    saved = File.open(File.join(Dir.pwd, fn), 'r')
    loaded_game = YAML.unsafe_load(saved)
    saved.close
    puts `clear`
    loaded_game
end

def play_game
    puts "\t\tGame of hangman\n\tChoose:\n\t1. New Game\n\t2.Load Game\n"
    choice = gets.chomp
    until['1', '2'].include?(choice)
        puts `clear`
        puts "\tERROR!!!\n\tPlease enter 1 or 2\n"
    end
    puts `clear`
    game = choice == '1' ? Hangman.new : load_game
    until game.over?
        if game.check_input == 'save'
            continue = save_helper(game)
            return if continue == 'n'
        end
    end
    puts `clear`
    puts game.win ? "\tYou win!!!\n\tWord was #{game.word}" : "\tBetter luck next time!!!\s\tWord was #{game.word}\n"
    puts
end

play_game