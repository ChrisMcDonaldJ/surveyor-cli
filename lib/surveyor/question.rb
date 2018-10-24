module Surveyor
  class Question
    attr_reader :id, :text, :type, :theme

    def initialize(id:, text:, type:, theme:)
      @id = id
      @text = text
      @type = type
      @theme = theme
    end

    def inspect
      {
        "id" => id,
        "text" => text,
        "type" => type,
        "theme" => theme,
      }
    end
  end
end
