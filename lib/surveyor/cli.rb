require "optparse"

ARGV << "-h" if ARGV.empty?

module Surveyor
  class CLI
    def initialize
      survey = Survey.new(name: "CLI Survey")
      OptionParser.new do |opts|
        opts.banner = "Example usage:"
        opts.on("-s", "--survey FILE", "Survey data input file") { |opt| survey.add_questions(opt) }
        opts.on("-r", "--responses FILE", "Responses data input file") { |opt| survey.add_responses(opt) }
        opts.on("-h", "--help", "Show this message") { puts opts }
      end.parse!
      puts survey.inspect
    end
  end
end
