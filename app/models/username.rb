# frozen_string_literal: true

class Username < ApplicationRecord
  has_many :tweets
  # accepts_nested_attributes_for :tweets
end
