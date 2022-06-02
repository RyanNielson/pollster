class Choice < ApplicationRecord
  validates :text, presence: true
  validates :poll, presence: true

  belongs_to :poll
  has_many :votes

  # broadcasts_to lambda { |choice|
  #   p 'RYAN UPDATED CHOICE'
  #   p choice
  #   [choice.poll, :choices]
  # }, inserts_by: :prepend # , target: 'board_messages'
end
