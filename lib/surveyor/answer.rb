module Surveyor
  class Answer
    attr_reader :id, :value

    def initialize(id:, value:)
      @id = id
      @value = value
    end

    def inspect
      {
        "id" => id,
        "value" => value,
      }
    end

    def valid?
      question.valid_answer?(value)
    end
  end
end
