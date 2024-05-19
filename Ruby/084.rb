# Approach: Monte Carlo Simulation Method
# As we don't have to find exact probabilities, just the top 3. This should work well with decent amount of rolls.
# rand(n) - Generates a random number from 0 to n - 1
#
# Answer: 101524; Time: 0.079223 seconds
STEPS = 10 ** 5
DIE = 4

GO = 0
R1 = 5
JAIL = 10
C1 = 11
E3 = 24
G2J = 30
H2 = 38
R = [5, 15, 25, 35]
U = [12, 28]

CC = [2, 17, 33]
CH = [7, 22, 36]
CC_CARD = [GO, JAIL] + [-1] * 14
CH_CARD = [GO, JAIL, C1, E3, H2, R1, R, R, U, -3] + [-1] * 6

time = Time.now

# keeps track of how many times you visit nth square on the board (GO is 0)
board_counts = Hash.new(0)

def roll_dice
  [rand(DIE) + 1, rand(DIE) + 1]
end

# start - position where the player rolled from
# returns destination - position where the player ends
def roll(start)
  dice1, dice2 = roll_dice
  if dice1 == dice2
    destination = ( start + dice1 + dice2 ) % 40
    dice1, dice2 = roll_dice
    if dice1 == dice2
      destination = ( start + dice1 + dice2 ) % 40
      dice1, dice2 = roll_dice
      if dice1 == dice2 # 3 consecutive doubles
        destination = JAIL
        return destination
      end
    end
  end
  destination = ( start + dice1 + dice2 ) % 40
  # Go to Jail
  if destination == G2J
    destination = JAIL
  # Community Chest
  elsif CC.include?(destination)
    # card = rand(16) # 0 indexed, randomly picked
    card = CC_CARD.first
    CC_CARD.delete_at(0)
    CC_CARD.push(card)
    destination = card if card != -1
  # Chance
  elsif CH.include?(destination)
    # card = rand(16) # 0 indexed, randomly picked
    card = CH_CARD.first
    CH_CARD.delete_at(0)
    CH_CARD.push(card)
    if card != -1
      case card
      when -3
        destination -= 3
      when U
        while !U.include?(destination)
          destination += 1
          destination %= 40
        end
      when R
        while !R.include?(destination)
          destination += 1
          destination %= 40
        end
      else
        destination = card
      end
    end
  end
  destination
end

start = 0
CC_CARD.shuffle!
CH_CARD.shuffle!
STEPS.times do
  destination = roll(start)
  board_counts[destination] += 1
  start = destination
end
puts board_counts.sort_by { |k, v| -v }.to_h
puts board_counts.sort_by { |k, v| -v }.to_h.keys.first(3).map { |t| t < 10 ? '0' + t.to_s : t.to_s }.join('')
puts "#{Time.now - time} seconds"