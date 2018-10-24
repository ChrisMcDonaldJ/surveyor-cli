module Surveyor
  class RatingQuestion < Question
    def valid_answer?(rating)
      rating.between?(1, 5)
    end
  end
end
