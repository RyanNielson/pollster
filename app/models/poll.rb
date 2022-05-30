class Poll < ApplicationRecord
  has_many :choices

  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :text, presence: true

  accepts_nested_attributes_for :choices
end
