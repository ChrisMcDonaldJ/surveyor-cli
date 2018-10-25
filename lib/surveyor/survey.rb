require "csv"
require "yaml"

module Surveyor
  class Survey
    attr_reader :name, :questions, :responses

    def initialize(name:)
      @name = name
      @questions = []
      @responses = []
    end

    # Returns an array of hashes to questions from the CSV file provided.
    # ==== Attributes
    # * +file+ - Path to CSV file
    def add_questions(file)
      raise "File does not exist" unless File.file?(file)
      raise "File is not a CSV file" unless File.extname(file) == ".csv"

      @questions = CSV.open(file, headers: :first_row, header_converters: :symbol).map.with_index do |question, index|
        Question.new(id: index, **question.to_h)
      end
    end

    # Returns an array of hashes to responses from the CSV file provided.
    # ==== Attributes
    # * +file+ - Path to CSV file
    def add_responses(file)
      raise "File does not exist" unless File.file?(file)
      raise "File is not a CSV file" unless File.extname(file) == ".csv"

      @responses = CSV.foreach(file).map do |response|
        Response.new(
          email: response[0],
          id: response[1],
          submitted_at: response[2],
          answers: add_answers(response[3..-1]),
        )
      end
    end

    # Returns an array of answer objects that have submitted from a response.
    def add_answers(array)
      array.map.with_index do |answer, index|
        Answer.new(id: index, value: answer)
      end
    end

    # Returns an array of participants that have submitted the survey.
    def participants
      responses.select(&:submitted?)
    end

    # Returns the total number of participants.
    def participant_count
      participants.length
    end

    # Returns the percentage of participation.
    def participation_percentage
      responses.empty? ? 0 : (participant_count / responses.length.to_f * 100).round(2)
    end

    # Returns breakdown of rating questions with the average rating.
    def rating_question_average
      questions.select { |question| question.type == "ratingquestion" }.map do |question|
        {
          "Question" => question.text,
          "Theme" => question.theme,
          "Average Rating" => return_average(answers_for_question(question.id)),
        }
      end
    end

    # Returns an array of all the answers to a particular question.
    # ==== Attributes
    # * +id+ - id or position of question within Survey
    def answers_for_question(id)
      participants.map { |response| response.answer_for_question(id).value }.compact
    end

    # Returns the average of an array of integers.
    # ==== Attributes
    # * +array+ - Array of intgers
    def return_average(array)
      array.empty? ? 0 : array.map(&:to_i).instance_eval { reduce(:+) / size.to_f }.round(2)
    end


    # Returns a string containing a human-readable representation of the object.
    def inspect
      breakdown = rating_question_average
      {
        "Participation Status" => {
          "Submitted" => {
            "Percentage" => "#{participation_percentage}%",
            "Amount" => participant_count,
          },
        },
        "Rating Questions Breakdown" => breakdown == [] ? "No rating questions found." : breakdown.sort_by { |response| response["Average Rating"] }, # .group_by { |response| response["Theme"] },
      }.to_yaml
    end
  end
end
