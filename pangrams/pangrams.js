// Regular expression practice

// A pangram is a sentence that contains every single letter of the alphabet at least once. 
// For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant). 

function isPangram(str){
    return (str.match(/([a-z])(?!.*\1)/gi) || []).length === 26;
}
