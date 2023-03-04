require 'csv'

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

contents.each do |line|
    number = line[:homephone]
    cleaner_number = number.gsub(/[^0-9]/, '')
end