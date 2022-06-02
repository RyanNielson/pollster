class Poll < ApplicationRecord
  include Sluggable

  has_many :choices, -> { order(created_at: :asc) }

  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :text, presence: true
  validate :require_two_choices

  accepts_nested_attributes_for :choices, reject_if: proc { |attributes| attributes['text'].blank? }

  def to_param
    slug
  end

  def total_votes_count
    choices.sum(:votes_count)
  end

  private

  def require_two_choices
    errors.add(:choices, 'You must provide at least two choices') if choices.size < 2
  end
end
