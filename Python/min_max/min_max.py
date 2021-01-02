def check_array_monotype(arr, passed_type):
    for item in arr:
        if type(item) is not passed_type: raise Exception(f'Cannot compare {passed_type} with {type(item)}.')

def min(*args):
    check_array_monotype(args, int)
    print(sorted(args)[0])

def max(*args):
    check_array_monotype(args, int)
    print(sorted(args)[len(args) - 1])

min(-3333333333333, 100_000_000, 10_000, 100_000, 1, -22222)
max(-3333333333333, 100_000_000, 10_000, 100_000, 1, -22222)
