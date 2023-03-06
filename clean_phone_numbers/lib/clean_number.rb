require 'csv'
require 'erb'

def number_cleanup (num)
    if (num.length >= 11 && num[0] != '1') || num.length < 10
        'BAD NUMBER'
    else
        num
    end
end

def clear_phonebook(fn)
    File.delete(fn) if File.exist?(fn)
end

def write_to_file(arr, fn)
    arr.sort!
    filename = 'phonebook.html'
    File.open(filename, 'w') {|f| f.puts fn}
end

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
filename = 'phonebook.txt'
template_phonebook = File.read('phonebook.erb')
erb_template = ERB.new template_phonebook
clear_phonebook(filename)
arr = []
contents.each do |line|
    number = number_cleanup (line[:homephone].gsub(/[^0-9]/, ''))
    fullname = line[:last_name] + ', ' + line[:first_name]
    if number.class == String
        number = number [1..10] if number.length == 11 && number[0] == '1'
        arr.push(fullname.ljust(30) + ' : ' + number)
    end
end
phonebook = erb_template.result(binding)
write_to_file(arr, phonebook)
