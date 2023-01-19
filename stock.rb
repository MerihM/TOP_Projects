
def number_of_arrays(num) 
    return ((num * (num + 1))/2)
end

def populate_array(arr)
    num_of_arrays = number_of_arrays(arr.length - 1)
    array_of_values = Array.new(num_of_arrays) {Array.new()}
    arr_o_val_index = 0
    arr.each_with_index do
        |value, index|
        for i in index+1...arr.length
            array_of_values[arr_o_val_index].push(value - arr[i])
            array_of_values[arr_o_val_index].push(index)
            array_of_values[arr_o_val_index].push(i)
            arr_o_val_index += 1
        end
    end
    array_of_values
end

def stock_picker(input_arr)
    
    temp_arr = populate_array(input_arr)
    max_val = temp_arr[0]
    temp_arr.each do 
        |arr|
        max_val = arr if arr[0] >= max_val[0]
    end
    max_val.shift
    p max_val
end


stock_picker([17,3,6,9,15,8,6,1,10])