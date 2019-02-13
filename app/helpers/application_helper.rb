module ApplicationHelper
    def toArray(word)
        word_array = word.upcase.split('')
        rand_letters = ((0...12).map { randLetter(word_array) }.join).split('')
        word_array += rand_letters
        word_string = word.upcase
        return [word_array.shuffle!, word_string]
    end

    def randLetter(word_array)
        loop do
            gene = (65 + rand(26)).chr
            check = word_array.include?(gene)
            return gene if !check
        end
    end
end
