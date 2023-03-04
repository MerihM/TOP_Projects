require 'csv'

def number_cleanup (num)
    return num unless (num.length >= 11 && num[0] != '1') || num.length < 10
end
contents = CSV.open('event_attendees_full.csv', headers: true, header_converters: :symbol)
filename = 'phonebook.txt'
arr = []
contents.each do |line|
    number = number_cleanup (line[:homephone].gsub(/[^0-9]/, ''))
    lastname = line[:last_name]
    name = line[:first_name]
    fullname = lastname + ', ' + name
    if number.class == String
        number = number [1..10] if number[0] == '1'
        arr.push(fullname.ljust(30) + ' : ' + number)
    end
end
arr.sort!
arr.each do
    |mem|
    File.open(filename, 'a'){|f| f.puts mem}
end