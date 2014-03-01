def palindrome?(str)
    input = str.downcase.gsub(/([^a-z])/,"")
    input == input.reverse    
end

def count_words(str)
    counter = {}
    words = str.downcase.scan(/\w+/)
    words.each {|word| 
        counter[word] = 0 unless counter.has_key?(word)
        counter[word] += 1
    }
    counter
end
