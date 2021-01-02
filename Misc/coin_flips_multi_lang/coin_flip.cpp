#include <iostream>

int main() {
    int heads_count = 0;
    int tails_count = 0;
    int coin_flips = 100'000'000;
    
    for (int i = 0; i < coin_flips; i++) {
        ((rand() % 2 + 1) == 1) ? heads_count++ : tails_count++;
    }
    
    std::cout << "Tails #: " << tails_count;
    std::cout << "\n";
    std::cout << "Heads #: " << heads_count;
    return 0;
}
