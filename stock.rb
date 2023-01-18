
def number_of_arrays(num) 
    return ((num * (num + 1))/2)
end
def stock_picker(input_arr)
    num_of_arrays = number_of_arrays(input_arr.length)
    array_of_pairs = Array.new(num_of_arrays) {Array.new(2, 0)}
    array_of_indices = Array.new(num_of_arrays) {Array.new(2, 0)}
    p array_of_indices
    p array_of_pairs
    # Make array of pairs, there will be ((array.length * (array.length + 1))/2 )pairs,
    # sum of all numbers from 1 to array.length
    # Make array of indices

end


stock_picker([17,3,6,9,15,8,6,1,10])