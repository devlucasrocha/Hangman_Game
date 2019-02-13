module ApplicationHelper
    def toArray(word)
        word_array = word.upcase.split('')
        rand_letters = ((0...3).map { (65 + rand(26)).chr }.join).split('')
        word_array += rand_letters
        word_string = word.upcase
        return [word_array.shuffle!, word_string]
    end
end
