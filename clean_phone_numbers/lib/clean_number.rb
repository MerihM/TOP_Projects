require 'csv'

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

contents.each do |line|
    number = line[:homephone]
    lastname = line[:last_name]
    name = line[:first_name]
    cleaner_number = number.gsub(/[^0-9]/, '')
    puts "Error! #{name} #{lastname} has bad number, it has #{cleaner_number.length} digits" if (cleaner_number.length >= 11 && cleaner_number[0] != '1') || cleaner_number.length < 10
end