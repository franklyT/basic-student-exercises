from random import choice

pw_key = "!-=+?><()*%abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
pw_length = 14
password_count = 20

for iterate_pw_count in range(1, password_count + 1):
    pw = []
    
    for iterate_pw in range(0, pw_length):
        pw.append(choice(pw_key))

    print(f"Password {iterate_pw_count}: " + "".join(pw))

