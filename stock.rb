def number_of_arrays(num) 
    return ((num * (num + 1))/2)
end

def populate_array(arr)
    array_of_values = Array.new(number_of_arrays(arr.length - 1)) {Array.new()}
    aov_index = 0
    arr.each_with_index do
        |value, index|
        for i in index+1...arr.length
            array_of_values[aov_index].push(value - arr[i]).push(index).push(i)
            aov_index += 1
        end
    end
    array_of_values
end

def stock_picker(input_arr)
    temp_arr = populate_array(input_arr)
    max_val = temp_arr[0]
    temp_arr.each {|arr| max_val = arr if arr[0] >= max_val[0]}
    max_val.shift
    p max_val
end

stock_picker([17,3,6,9,15,8,6,1,10])