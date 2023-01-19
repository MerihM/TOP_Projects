
def number_of_arrays(num) 
    return ((num * (num + 1))/2)
end
def stock_picker(input_arr)
    num_of_arrays = number_of_arrays(input_arr.length - 1)
    array_of_values = Array.new(num_of_arrays) {Array.new()}
    arr_o_val_index = 0
    input_arr.each_with_index do
        |value, index|
        for i in index+1...input_arr.length
            array_of_values[arr_o_val_index].push(value - input_arr[i])
            array_of_values[arr_o_val_index].push(index)
            array_of_values[arr_o_val_index].push(i)
            arr_o_val_index += 1
        end
    end
    p array_of_values
end


stock_picker([17,3,6,9,15,8,6,1,10])