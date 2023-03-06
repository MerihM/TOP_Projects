require 'csv'
require 'date'

contents = CSV.open('event_attendees_full.csv', headers: true, header_converters: :symbol)
count = Hash.new(0)
contents.each do 
    |f|
    test_date = DateTime.strptime(f[:regdate], "%m/%d/%Y %k:%M")
    count[test_date.hour] += 1
end
count = count.sort_by{|h, num| num}
p count