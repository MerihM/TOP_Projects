require 'csv'
require 'date'

contents = CSV.open('event_attendees_full.csv', headers: true, header_converters: :symbol)
count = Hash.new(0)
24.times {|n| count[n] += 0}
contents.each do 
    |f|
    test_date = DateTime.strptime(f[:regdate], "%m/%d/%Y %k:%M")
    count[test_date.hour] += 1
end
count = count.sort_by{|h, num| num}
puts "Peak registration hours are: "
5.times {|n| puts "#{count[(n+1)*(-1)][0]}, with #{count[(n+1)*(-1)][1]} registrations"}