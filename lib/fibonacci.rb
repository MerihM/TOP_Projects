def fibs (num_of_arr_elements)
    fib_arr = [0]
    (num_of_arr_elements).times {fib_arr.length == 1 ? fib_arr << 1 : fib_arr << (fib_arr[-1] + fib_arr[-2])}
    fib_arr[0..-2]
end

p fibs 8