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
  end
end
