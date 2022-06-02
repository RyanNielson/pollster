class Poll < ApplicationRecord
  include Sluggable

  has_many :choices

  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :text, presence: true

  accepts_nested_attributes_for :choices, reject_if: proc { |attributes| attributes['text'].blank? }

  def to_param
    slug
  end

  def total_votes_count
    choices.sum(:votes_count)
  end
end
