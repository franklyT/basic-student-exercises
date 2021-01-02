def manual_range(min, max, step = 1):
    collected_range = []
    iterator = min

    while iterator <= max:
        collected_range.append(iterator)
        iterator += step

    return collected_range

def recursive_sum(num_arr, num_sum = 0):
    if len(num_arr) < 1: return print(num_sum)

    recursive_sum(num_arr[1:], num_sum + num_arr[0])


def iterative_sum(num_arr):
    sum_num = 0

    for num in num_arr:
        sum_num += num

    print(sum_num)

recursive_sum(manual_range(0, 100))
iterative_sum(manual_range(0, 100))

# Compare performance. Which can handle a wider range? Why? Which should we use in this case? Consider readability versus functionality.
