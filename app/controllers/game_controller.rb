class GameController < ApplicationController
  def main_page
    @words = Word.find(randomId())
    showRandomWord(@words.word)
  end

  private
  def randomId
    r = Random.new
    r.rand(1...Word.all.size + 1)
  end

  def showRandomWord word
    puts "\033[1;31m\n\n\n\n\t\t\t################# SECRET WORD -> #{word} #################\n\n\n\n\033[m"
  end
end
