require_relative "card"
require_relative "deck"
require_relative "hand"
require 'pry'
player = Hand.new
computer = Hand.new
FINAL_SCORES = []
# Your code here...
def deal_card(player)
  player.draw_card
  puts "Player was dealt #{player.your_cards[-1].rank} #{player.your_cards[-1].suit}"
end
def score(player)
  player.score
end
def players_turn(player)
  puts "Player score: #{score(player)}"
  if score(player) > 21
    puts "Bust. Sorry. You lose"
  end
  if score(player) == 21
    puts "Blackjack! You win!"
  end
  response = ""
  if response.downcase != "s" && score(player) < 21
    while response.downcase != "h" && response.downcase != "s"
      print "Please enter 'h' for hit or 's' for stand: "
      response = gets.chomp
      if response.downcase == "h"
        player_hits(player)
      elsif response.downcase == "s"
        puts "Player stands at #{score(player)}"
        FINAL_SCORES << score(player)
      end
    end
  end
end

def player_hits(player)
  deal_card(player)
  players_turn(player)
end

def dealer_draw(dealer)
  dealer.draw_card
  puts "Dealer was dealt #{dealer.your_cards[-1].rank} #{dealer.your_cards[-1].suit}"
end

def dealers_turn(dealer)
  puts "Dealer score: #{score(dealer)}"
  while score(dealer) < 17
    dealer_draw(dealer)
    puts "Dealer score: #{score(dealer)}"
  end
  if score(dealer) > 21
    puts "Dealer busts. You win!"
  elsif score(dealer) == 21
    puts "Dealer got blackjack. You lose"
  elsif score(dealer) < 21 && score(dealer) >=17
    puts "Dealer stands"
    FINAL_SCORES << score(dealer)
    find_winner(FINAL_SCORES)
  end
end

def find_winner(score_array)
  winning_score = 0
  winning_index = -1
  score_array.each_with_index do |score, index|
    if score > winning_score
      winning_score = score
      winning_index = index
    end
  end
  if score_array[0] == score_array [1]
    puts "Push"
  elsif winning_index == 0
    puts "You won!"
  elsif winning_index == 1
    puts "You lost"
  end
end

def dealers_starts(dealer)
  2.times { dealer_draw(dealer) }
  dealers_turn(dealer)
end

def game_start(player, dealer)
  2.times { deal_card(player) }
  players_turn(player)
  if score(player) < 21
    dealers_starts(dealer)
  end
end

game_start(player, computer)
# binding.pry
