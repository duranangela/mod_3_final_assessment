class ValidationPresenter
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def root
    ValidationService.new(word).root
  end

  def message
    if root == 'error'
      "'#{word}' is a not a valid word"
    else
      "'#{word}' is a valid word and its root form is '#{root}'"
    end
  end
end
