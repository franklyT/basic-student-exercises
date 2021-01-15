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

    print("Heads")
    print("Count: " + str(heads_count))
    print("Probability: ~" + str(heads_probability) + "%")
    
    print("")
    
    print("Tails")
    print("Count: " + str(tails_count))
    print("Probability: ~" + str(tails_probability) + "%")
    
    
flip_coin(100000)
