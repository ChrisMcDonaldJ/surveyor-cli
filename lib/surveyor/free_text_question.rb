module Surveyor
  class FreeTextQuestion < Question
    def valid_answer?(answer)
      answer.is_a?(String)
    end
  end
end
