class GameController < ApplicationController
  before_action :validate_word

  def main_page
    @words = Word.find(@randId)
  end

  private
  def validate_word
    @randId = randomId
    ids = Word.all.ids
    inside = ids.include?(@randId)
    msg = "#{ids} -> #{@randId} = #{inside}"
    if (!inside)
      showRandomWord(msg, 31)
      loop do
        @randId = randomId
        inside = ids.include?(@randId)
        msg = "[-] #{ids} -> #{@randId} = #{inside} "
        if (inside)
          msg += "=> #{Word.find(@randId).word}"
          showRandomWord(msg, 32)
          return @randId
        else
          showRandomWord(msg, 31)
        end
      end
    else
      msg += " => #{Word.find(@randId).word}"
      showRandomWord(msg, 32)
      return @randId
    end
  end

  def randomId
    r = Random.new
    r.rand(1...Word.all.size + 1)
  end

  def showRandomWord word, color
    puts "\033[1;#{color}m\n\n\n\n\t################# #{word} #################\n\n\n\n\033[m"
  end
end
