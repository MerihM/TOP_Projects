require 'csv'

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
contents.each do 
    |f|
    puts f[:regdate]
end
