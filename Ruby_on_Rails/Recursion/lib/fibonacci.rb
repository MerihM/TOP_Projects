def fibs (num_of_arr_elements)
    fib_arr = [0]
    (num_of_arr_elements).times {fib_arr.length == 1 ? fib_arr << 1 : fib_arr << (fib_arr[-1] + fib_arr[-2])}
    fib_arr[0..-2]
end

def fibs_rec (num)
    return [0] if num == 0
    return [0, 1] if num == 1
    arr = fibs_rec (num - 1)
    arr << arr[-1] + arr[-2]
end
