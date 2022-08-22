class GamesController < ApplicationController
  def letter
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
    @letters
  end

  def dictionary
    url = "https://wagon-dictionary.herokuapp.com/?????"
    dictionary = URI.open(url).read
    JSON.parse(dictionary)
  end

  def score
  end
end
