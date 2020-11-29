class Example < ApplicationRecord
  belongs_to :term

  validate :example_includes_keyword

  private

  def example_includes_keyword
    keyword_parts = keyword.split(', ')
    unless keyword_parts.all?{|part| sentence.include? part}
      errors.add(:keyword, "keyword not found")
    end
  end
end
