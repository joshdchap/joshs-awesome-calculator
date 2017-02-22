class Calculator
  
  def self.valid_calculation?(input)
    input && !input.empty? && input.match(/^(\d+[\+\-\*\/]{1})+\d+/).to_s == input 
  end
  
  def self.calculate(input)
    numbers = get_numbers(input)
    operators = get_operators(input)
    
    mult_numbers, mult_opers = multiplication(numbers, operators)
    add_numbers, add_opers = addition(mult_numbers, mult_opers)
    
    add_numbers[0].to_i == add_numbers[0] ? add_numbers[0].to_i : add_numbers[0].round(2)
  end
  
  private
  
  def self.get_numbers(input)
    # an array of just the numbers
    input.split(/[\+\-\*\/]/).map(&:to_f)
  end
  
  def self.get_operators(input)
    # an array of just the operators
    input.split(/\d+/).reject(&:empty?)
  end
  
  def self.do_math(nums, operators, op1, op2)
    while operators.include?(op1) || operators.include?(op2) do
      i = operators.index{|x| x == op1 || x == op2}
      case operators[i]
      when "*"
        nums[i] = nums[i] * nums[i+1]
      when "/"
        nums[i] = nums[i] / nums[i+1]
      when "+"
        nums[i] = nums[i] + nums[i+1]
      when "-"
        nums[i] = nums[i] - nums[i+1]
      end
      nums.delete_at(i+1)
      operators.delete_at(i)
    end
    [nums, operators]
  end
  
  def self.multiplication(nums, operators)
    do_math(nums, operators, "*", "/")
  end
  
  def self.addition(nums, operators)
    do_math(nums, operators, "+", "-")
  end
  
end