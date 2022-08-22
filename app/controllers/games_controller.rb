require "open-uri"
require "json"

class GamesController < ApplicationController

  def letter
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
    @letters
  end

  def dictionary(word)
    dictionary = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    get_word = JSON.parse(dictionary.read)
    get_word['found']
  end

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def score
    @letters = params[:letters]
    @word = (params[:word] || "").upcase
    @included = included?(@word, @letters)
    @english_word = dictionary(@word)
  end
end
