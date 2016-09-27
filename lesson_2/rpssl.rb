require 'pry'
VALID_CHOICES = { r: 'rock', p: 'paper', x: 'scissors',
                  s: 'spock', l: 'lizard' }
WIN_COMBOS = { r: [:x, :l],
               p: [:r, :s],
               x: [:p, :l],
               s: [:r, :x],
               l: [:s, :p] }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WIN_COMBOS[first].include?(second)
end

def gets_choice
  prompt("Choose one: #{VALID_CHOICES.values.join(', ')}")
  prompt("Enter letter for choice")
  prompt("-- 'R' for rock (beats scissors and lizard)")
  prompt("-- 'P' for paper (beats rock and spock)")
  prompt("-- 'X' for scissors (beats paper and lizard)")
  prompt("-- 'S' for spock (beats rock and scissors)")
  prompt("-- 'L' for lizard (beats spock and paper)")
  gets.chomp.downcase.to_sym
end

def gets_comp_choice
  print("Computer is thinking..")
  10.times do
    print ".."
    sleep 0.2
  end
  print "\n"
  VALID_CHOICES.keys.sample
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

def play_again
  answer = ''
  loop do
    prompt("Do you want to play again? (y/n)")
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
    prompt("Invalid choice")
  end
  answer
end

score = { player_count: 0, computer_count: 0 }

loop do
  prompt("Welcome to Rock, Paper, Scissors, Spock, Lizard")
  prompt("First player to 5 wins!")
  while score[:player_count] < 5 && score[:computer_count] < 5
    choice = ''
    loop do
      choice = gets_choice

      if VALID_CHOICES.key?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = gets_comp_choice
    puts "----------------------------------------------------------"
    prompt("You chose: #{VALID_CHOICES[choice]}")
    prompt("Computer chose: #{VALID_CHOICES[computer_choice]}")

    score = score_update(choice, computer_choice, score)
    display_result(choice, computer_choice, score)
    end_of_game_check(score)
  end

  break if play_again == 'n'
  score = { player_count: 0, computer_count: 0 }
end

prompt("Thank you for playing. Good-bye!")
