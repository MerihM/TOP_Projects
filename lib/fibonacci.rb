def fibs (num_of_arr_elements)
    fib_arr = [0]
    for i in 1..num_of_arr_elements
        fib_arr.length == 1 ? fib_arr << 1 : fib_arr << (fib_arr[-1] + fib_arr[-2])
    end
    p fib_arr[0..-2]
end
