class Tweet < ApplicationRecord
  belongs_to :username

  validates :body, presence: true ,length: { maximum: 1250}
end
