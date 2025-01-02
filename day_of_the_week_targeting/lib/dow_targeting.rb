require 'csv'
require 'date'

def convert_day (day)
    case day 
        when 1 then 'Monday'
        when 2 then 'Tuesday'
        when 3 then 'Wednesday'
        when 4 then 'Thursday'
        when 5 then 'Friday'
        when 6 then 'Saturday'
        when 0 then 'Sunday'
    end
end

contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
count = Hash.new(0)
contents.each do 
    |f|
    test_date = DateTime.strptime(f[:regdate], "%m/%d/%Y %k:%M")
    count[test_date.wday] += 1
end
count = count.sort_by{|d, num| num}
puts "People register most often on #{convert_day(count[-1][0])}"