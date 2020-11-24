class Example < ApplicationRecord
  belongs_to :term

  validate :example_includes_keyword

  private

  def example_includes_keyword
    unless sentence.include? keyword
      errors.add(:keyword, "keyword not found")
    end
  end
end
