require "spec_helper"
require "yaml"

RSpec.describe Surveyor::Survey do
  let(:survey_1) { described_class.new(name: "Survey 1") }
  let(:survey_2) { described_class.new(name: "Survey 2") }

  context "when initalised with correct path to survey and responses that include data" do
    it "returns the correct questions" do
      survey_1.add_questions("example-data/survey-1.csv")
      expect(survey_1.questions.map(&:inspect)).to eq(
        [
          {
            "id" => 0,
            "text" => "I like the kind of work I do.",
            "type" => "ratingquestion",
            "theme" => "The Work",
          },
          {
            "id" => 1,
            "text" => "In general, I have the resources (e.g., business tools, information, facilities, IT or functional support) I need to be effective.",
            "type" => "ratingquestion",
            "theme" => "The Work",
          },
          {
            "id" => 2,
            "text" => "We are working at the right pace to meet our goals.",
            "type" => "ratingquestion",
            "theme" => "The Work",
          },
          {
            "id" => 3,
            "text" => "I feel empowered to get the work done for which I am responsible.",
            "type" => "ratingquestion",
            "theme" => "The Place",
          },
          {
            "id" => 4,
            "text" => "I am appropriately involved in decisions that affect my work.",
            "type" => "ratingquestion",
            "theme" => "The Place",
          },
        ],
      )
    end
    it "returns the correct responses" do
      survey_1.add_responses("example-data/survey-1-responses.csv")
      expect(survey_1.responses.map(&:inspect)).to eq(
        [
          {
            "id" => "1",
            "submitted_at" => "2014-07-28T20:35:41+00:00",
            "email" => "employee1@abc.xyz",
            "answers" => [
              {
                "id" => 0,
                "value" => "5",
              }, {
                "id" => 1,
                "value" => "5",
              }, {
                "id" => 2,
                "value" => "5",
              }, {
                "id" => 3,
                "value" => "4",
              }, {
                "id" => 4,
                "value" => "4",
              },
            ],
          },
          {
            "id" => "2",
            "submitted_at" => "2014-07-29T07:05:41+00:00",
            "email" => nil,
            "answers" => [
              {
                "id" => 0,
                "value" => "4",
              }, {
                "id" => 1,
                "value" => "5",
              }, {
                "id" => 2,
                "value" => "5",
              }, {
                "id" => 3,
                "value" => "3",
              }, {
                "id" => 4,
                "value" => "3",
              },
            ],
          },
          {
            "id" => "3",
            "submitted_at" => "2014-07-29T17:35:41+00:00",
            "email" => nil,
            "answers" => [
              {
                "id" => 0,
                "value" => "5",
              }, {
                "id" => 1,
                "value" => "5",
              }, {
                "id" => 2,
                "value" => "5",
              }, {
                "id" => 3,
                "value" => "5",
              }, {
                "id" => 4,
                "value" => "4",
              },
            ],
          },
          {
            "id" => "4",
            "submitted_at" => "2014-07-30T04:05:41+00:00",
            "email" => "employee4@abc.xyz",
            "answers" => [
              {
                "id" => 0,
                "value" => "5",
              }, {
                "id" => 1,
                "value" => "5",
              }, {
                "id" => 2,
                "value" => "5",
              }, {
                "id" => 3,
                "value" => "4",
              }, {
                "id" => 4,
                "value" => "4",
              },
            ],
          },
          {
            "id" => "5",
            "submitted_at" => "2014-07-31T11:35:41+00:00",
            "email" => nil,
            "answers" => [
              {
                "id" => 0,
                "value" => "4",
              }, {
                "id" => 1,
                "value" => "5",
              }, {
                "id" => 2,
                "value" => "5",
              }, {
                "id" => 3,
                "value" => "2",
              }, {
                "id" => 4,
                "value" => "3",
              },
            ],
          },
          {
            "id" => "6",
            "submitted_at" => nil,
            "email" => "employee5@abc.xyz",
            "answers" => [
              {
                "id" => 0,
                "value" => nil,
              }, {
                "id" => 1,
                "value" => nil,
              }, {
                "id" => 2,
                "value" => nil,
              }, {
                "id" => 3,
                "value" => nil,
              }, {
                "id" => 4,
                "value" => nil,
              },
            ],
          },
        ],
      )
    end
    it "returns the correct participants" do
      survey_1.add_responses("example-data/survey-1-responses.csv")
      expect(survey_1.participants.map(&:inspect)).to eq(
        [
          {
            "id" => "1",
            "submitted_at" => "2014-07-28T20:35:41+00:00",
            "email" => "employee1@abc.xyz",
            "answers" => [
              {
                "id" => 0,
                "value" => "5",
              }, {
                "id" => 1,
                "value" => "5",
              }, {
                "id" => 2,
                "value" => "5",
              }, {
                "id" => 3,
                "value" => "4",
              }, {
                "id" => 4,
                "value" => "4",
              },
            ],
          },
          {
            "id" => "2",
            "submitted_at" => "2014-07-29T07:05:41+00:00",
            "email" => nil,
            "answers" => [
              {
                "id" => 0,
                "value" => "4",
              }, {
                "id" => 1,
                "value" => "5",
              }, {
                "id" => 2,
                "value" => "5",
              }, {
                "id" => 3,
                "value" => "3",
              }, {
                "id" => 4,
                "value" => "3",
              },
            ],
          },
          {
            "id" => "3",
            "submitted_at" => "2014-07-29T17:35:41+00:00",
            "email" => nil,
            "answers" => [
              {
                "id" => 0,
                "value" => "5",
              }, {
                "id" => 1,
                "value" => "5",
              }, {
                "id" => 2,
                "value" => "5",
              }, {
                "id" => 3,
                "value" => "5",
              }, {
                "id" => 4,
                "value" => "4",
              },
            ],
          },
          {
            "id" => "4",
            "submitted_at" => "2014-07-30T04:05:41+00:00",
            "email" => "employee4@abc.xyz",
            "answers" => [
              {
                "id" => 0,
                "value" => "5",
              }, {
                "id" => 1,
                "value" => "5",
              }, {
                "id" => 2,
                "value" => "5",
              }, {
                "id" => 3,
                "value" => "4",
              }, {
                "id" => 4,
                "value" => "4",
              },
            ],
          },
          {
            "id" => "5",
            "submitted_at" => "2014-07-31T11:35:41+00:00",
            "email" => nil,
            "answers" => [
              {
                "id" => 0,
                "value" => "4",
              }, {
                "id" => 1,
                "value" => "5",
              }, {
                "id" => 2,
                "value" => "5",
              }, {
                "id" => 3,
                "value" => "2",
              }, {
                "id" => 4,
                "value" => "3",
              },
            ],
          },
        ],
      )
    end
    it "returns the correct participant count" do
      survey_1.add_responses("example-data/survey-1-responses.csv")
      expect(survey_1.participant_count).to eq(5)
    end
    it "returns the correct participant percentage" do
      survey_1.add_responses("example-data/survey-1-responses.csv")
      expect(survey_1.participation_percentage).to eq(83.33)
    end
    it "returns the correct rating question breakdown" do
      survey_1.add_questions("example-data/survey-1.csv")
      survey_1.add_responses("example-data/survey-1-responses.csv")
      expect(survey_1.rating_question_average).to eq(
        [
          {
            "Question" => "I like the kind of work I do.",
            "Theme" => "The Work",
            "Average Rating" => 4.6,
          },
          {
            "Question" => "In general, I have the resources (e.g., business tools, information, facilities, IT or functional support) I need to be effective.",
            "Theme" => "The Work",
            "Average Rating" => 5.0,
          },
          {
            "Question" => "We are working at the right pace to meet our goals.",
            "Theme" => "The Work",
            "Average Rating" => 5.0,
          },
          {
            "Question" => "I feel empowered to get the work done for which I am responsible.",
            "Theme" => "The Place",
            "Average Rating" => 3.6,
          },
          {
            "Question" => "I am appropriately involved in decisions that affect my work.",
            "Theme" => "The Place",
            "Average Rating" => 3.6,
          },
        ],
      )
    end
    it "returns a string containing a human-readable representation of the survey" do
      survey_1.add_questions("example-data/survey-1.csv")
      survey_1.add_responses("example-data/survey-1-responses.csv")
      expect(YAML.safe_load(survey_1.inspect)).to eq(
        "Participation Status" => {
          "Submitted" => {
            "Percentage" => "83.33%",
            "Amount" => 5,
          },
        },
        "Rating Questions Breakdown" => [
          {
            "Question" => "I feel empowered to get the work done for which I am responsible.",
            "Theme" => "The Place",
            "Average Rating" => 3.6,
          },
          {
            "Question" => "I am appropriately involved in decisions that affect my work.",
            "Theme" => "The Place",
            "Average Rating" => 3.6,
          },
          {
            "Question" => "I like the kind of work I do.",
            "Theme" => "The Work",
            "Average Rating" => 4.6,
          },
          {
            "Question" => "In general, I have the resources (e.g., business tools, information, facilities, IT or functional support) I need to be effective.",
            "Theme" => "The Work",
            "Average Rating" => 5.0,
          },
          {
            "Question" => "We are working at the right pace to meet our goals.",
            "Theme" => "The Work",
            "Average Rating" => 5.0,
          },
        ],
      )
    end
  end

  context "when initalised with survey and responses that contain no data" do
    it "returns the correct questions" do
      survey_2.add_questions("example-data/survey-4.csv")
      expect(survey_2.questions.map(&:inspect)).to eq([])
    end
    it "returns the correct responses" do
      survey_2.add_responses("example-data/survey-4-responses.csv")
      expect(survey_2.responses.map(&:inspect)).to eq([])
    end
    it "returns the correct participants" do
      expect(survey_2.participants.map(&:inspect)).to eq([])
    end
    it "returns the correct participant count" do
      expect(survey_2.participant_count).to eq(0)
    end
    it "returns the correct participant percentage" do
      expect(survey_2.participation_percentage).to eq(0)
    end
    it "returns the correct rating question breakdown" do
      expect(survey_2.rating_question_average).to eq([])
    end
    it "returns a string containing a human-readable representation of the survey" do
      expect(YAML.safe_load(survey_2.inspect)).to eq(
        "Participation Status" => {
          "Submitted" => {
            "Percentage" => "0%",
            "Amount" => 0,
          },
        },
        "Rating Questions Breakdown" => "No rating questions found.",
      )
    end
  end

  context "when initalised with incorrect path to survey and responses" do
    it "responds with file not found message" do
    end
    it "responds with file not correct format message" do
    end
  end
end
