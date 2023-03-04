require 'csv'

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

contents.each do |line|
    number = line[:homephone]
    p number
end