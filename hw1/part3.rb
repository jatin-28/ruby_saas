def combine_anagrams(words)
    words.group_by { |word| word.downcase.chars.sort.join }.map {|key,value| value }
end

input = ["cars", "for", "potatoes", "racs", "four", "scar", "creams", "scream"]
combine_anagrams input

input = ["Cars", "fOr", "potatoes", "racs", "four", "scar", "cReams", "scream"]
combine_anagrams input

input = []
combine_anagrams input


