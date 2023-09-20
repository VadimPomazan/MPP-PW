def infix_to_rpn(expression)
  priority = {
    '+' => 1,
    '-' => 1,
    '*' => 2,
    '/' => 2
  }

  output = []
  operator_stack = []

  tokens = expression.split(/\s+/)

  tokens.each do |token|
    if token.match?(/\d+/)
      output.push(token)
    elsif priority.key?(token)
      while operator_stack.any? && priority[token] <= priority[operator_stack.last]
        output.push(operator_stack.pop)
      end
      operator_stack.push(token)
    elsif token == '('
      operator_stack.push(token)
    elsif token == ')'
      while operator_stack.any? && operator_stack.last != '('
        output.push(operator_stack.pop)
      end
      operator_stack.pop
    end
  end

  while operator_stack.any?
    output.push(operator_stack.pop)
  end

  return output.join(' ')
end
if ARGV.empty?
  puts "Please enter the mathematical expression through the command line. EX: .. \"2 + 3 * 4\" "
else
  infix_expression = ARGV.join(' ')
  rpn_expression = infix_to_rpn(infix_expression)
  puts "RPN expression:\n #{rpn_expression}"
end

