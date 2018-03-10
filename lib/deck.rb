require_relative "card"
require 'pry'

SUITS = ['♥', '♦', '♠', '♣']
RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']


class Deck
  # Your code here
  attr_reader :shoe
  def initialize
    @shoe = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @shoe << Card.new(suit, rank)
      end
    end
    @shoe.shuffle!
  end
end
# deck = Deck.new
# binding.pry
