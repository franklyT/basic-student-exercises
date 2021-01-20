from random import randint

def flip_coin(flips):
    heads_count = 0
    tails_count = 0

    for i in range(0, flips):
        if (randint(0, 1) == 0): 
            heads_count += 1
        else: 
            tails_count += 1
    
    heads_probability = (round(heads_count/flips, 1) * 100)
    tails_probability = (round(tails_count/flips, 1) * 100)

    return "Heads Probability: ~" + str(heads_probability) + "%" + " Tails Probability: ~" + str(tails_probability) + "%" 
