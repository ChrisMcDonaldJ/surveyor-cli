module Surveyor
  class Response
    attr_reader :email, :id, :submitted_at, :answers

    def initialize(email:, id:, submitted_at:, answers: [])
      @email = email
      @id = id
      @submitted_at = submitted_at
      @answers = answers
    end

    def inspect
      {
        "id" => id,
        "submitted_at" => submitted_at,
        "email" => email,
        "answers" => answers.map(&:inspect),
      }
    end

    def submitted?
      !submitted_at.nil?
    end

    def add_answer(answer)
      answers.push(answer)
    end
  end
end
