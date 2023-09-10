if ARGV.length != 2
  puts "You must enter two arguments (Stone Scissors or Paper)"
  puts "EX: Paper Scissors"
  exit
else
 usr_action = ARGV[0]
 comp_action = ARGV[1]
end

if usr_action == "Stone"
  if comp_action == "Stone"
    puts "Tie"
  elsif comp_action == "Paper"
    puts "You Lose"
  elsif comp_action == "Scissors"
    puts "You Win"
  end
elsif usr_action == "Paper"
  if comp_action == "Stone"
    puts "You Win"
  elsif comp_action == "Paper"
    puts "Tie"
  elsif comp_action == "Scissors"
    puts "You Lose"
  end
elsif usr_action == "Scissors"
  if comp_action == "Stone"
    puts "You Lose"
  elsif comp_action == "Paper"
    puts "You Win"
  elsif comp_action == "Scissors"
    puts "Tie"
  end
else
  puts "I didnt understand your choice"
  puts "EX: Paper Scissors"
  end