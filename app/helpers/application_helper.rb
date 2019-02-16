module ApplicationHelper
    def toArray(word)
        word_array = word.upcase
        rand_letters = randLetter(word)
        word_array = rand_letters
        word_string = word.upcase
        return [word_array.shuffle!, word_string]
    end
    
    def randLetter(word_array)
        letters = []
        (0...5).each do |e|
            gene = (0...8).map { (65 + rand(26)).chr }.join
            gene = gene.split('')
            gene.each do |l|
                if (letters.include?(l))
                    next
                end
                letters << l
            end
        end
        word_array = word_array.split('')
        word_array.each do |l|
            if (!letters.include?(l))
                letters << l
            end
        end
        letters.shuffle!
    end

    def colorBody
        if params[:controller] == "words"
            "white"
        else
            "orange"
        end
    end
end
