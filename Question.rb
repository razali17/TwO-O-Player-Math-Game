class Question
  attr_accessor :correct_answer, :ask_question

  def initialize()
    @number1 = rand(1...20)
    @number2 = rand(1...20)
    @correct_answer = @number1 + @number2
    @ask_question = "What does #{@number1} plus #{@number2} equal?"
  end
end
