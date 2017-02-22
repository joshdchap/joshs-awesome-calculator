class CalculatorController < ApplicationController
  def index
  end
  
  def calculate
    @formula = params[:q]
    @result = Calculator.valid_calculation?(@formula) ? 
              Calculator.calculate(@formula) : 
              "Please provide valid input"
    render :index
  end
end
