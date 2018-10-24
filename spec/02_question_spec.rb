require "spec_helper"

RSpec.describe Surveyor::Question do
  subject { described_class.new(id: 1, text: "I like the kind of work I do.", type: "ratingquestion", theme: "The Work") }

  context "when initalised" do
    it "has the correct question id" do
      expect(subject.id).to eq(1)
    end
    it "has the correct question text" do
      expect(subject.text).to eq("I like the kind of work I do.")
    end
    it "has the correct question type" do
      expect(subject.type).to eq("ratingquestion")
    end
    it "has the correct question theme" do
      expect(subject.theme).to eq("The Work")
    end
  end
end
