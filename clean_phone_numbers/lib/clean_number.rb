require 'csv'

def number_cleanup (num)
    return num unless (num.length >= 11 && num[0] != '1') || num.length < 10
end
contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

contents.each do |line|
    number = number_cleanup (line[:homephone].gsub(/[^0-9]/, ''))
    lastname = line[:last_name]
    name = line[:first_name]
    p number.class
end