class GameController < ApplicationController
  def main_page
    @words = Word.find(randomId())
  end

  private
  def randomId
    r = Random.new
    r.rand(1...Word.all.size + 1)
  end
end
