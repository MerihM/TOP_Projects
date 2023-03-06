require 'csv'
require 'date'

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
date_format = "%-m/%d/%Y"
contents.each do 
    |f|
    test_date = DateTime.strptime(f[:regdate], "%m/%d/%Y %k:%M")
    puts test_date.hour
end
