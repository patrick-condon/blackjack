require_relative 'deck'
require 'pry'

DECK = Deck.new
class Hand
  # Your code here
  attr_reader :your_cards
  def initialize
    @your_cards = []
    @deck = DECK
    @total = 0
    @aces = 0
  end

  def draw_card
    @your_cards << @deck.shoe.pop
  end

  def cards_left
    @deck.shoe.size
  end

  def score
    @total = 0
    @aces = 0
    @your_cards.each do |card|
      if card.rank == "A"
        @aces += 1
      elsif card.rank.to_i == 0
        @total += 10
      else
        @total += card.rank.to_i
      end
    end
    if @aces == 1 && @total <= 10
      @total += 11
    else
      @aces.times { @total += 1 }
    end
    return @total
  end
end
# deck = Deck.new
# player = Hand.new
# dealer = Hand.new
# binding.pry
