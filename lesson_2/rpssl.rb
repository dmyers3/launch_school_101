require 'pry'
VALID_CHOICES = %w(rock paper scissors spock lizard)
CHOICE_HASH = { r: 'rock', p: 'paper', x: 'scissors', s: 'spock', l: 'lizard' }
def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper'))
end

def gets_choice
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  prompt("You can enter letter for choice")
  prompt("-- 'R' for rock (beats scissors and lizard)")
  prompt("-- 'P' for paper (beats rock and spock)")
  prompt("-- 'X' for scissors (beats paper and lizard)")
  prompt("-- 'S' for spock (beats rock and scissors)")
  prompt("-- 'L' for lizard (beats spock and paper)")
  gets.chomp.downcase
end

def score_update(player, computer, score)
  if win?(player, computer)
    score[:player_count] += 1
  elsif win?(computer, player)
    score[:computer_count] += 1
  end
  score
end

def display_result(player, computer, score)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lost :(")
  else
    prompt("You tied!")
  end
  prompt("Current score is You: #{score[:player_count]}")
  prompt("            Computer: #{score[:computer_count]}")
  puts "----------------------------------------------------------"
end

def end_of_game_check(score)
  if score[:player_count] == 5
    prompt("Congratulations, You Win!")
  elsif score[:computer_count] == 5
    prompt("Sorry, You Lose")
  end
end

score = { player_count: 0, computer_count: 0 }
loop do
  prompt("Welcome to Rock, Paper, Scissors, Spock, Lizard")
  prompt("First player to 5 wins!")
  while score[:player_count] < 5 && score[:computer_count] < 5
    choice = ''
    loop do
      choice = gets_choice

      if VALID_CHOICES.include?(CHOICE_HASH[choice.to_sym] || choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample
    puts "----------------------------------------------------------"
    prompt("You chose: #{CHOICE_HASH[choice.to_sym] || choice}, computer chose: #{computer_choice}")

    score = score_update(CHOICE_HASH[choice.to_sym] || choice, computer_choice, score)
    display_result(CHOICE_HASH[choice.to_sym] || choice, computer_choice, score)

    end_of_game_check(score)
  end

  prompt("Do you want to play again? (y/n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good-bye!")
