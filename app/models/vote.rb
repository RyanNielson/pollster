class Vote < ApplicationRecord
  validates :choice, presence: true

  belongs_to :choice, counter_cache: true

  after_create_commit :broadcast_later

  def broadcast_later
    # TODO: Can this be done without having to define my own method?
    broadcast_replace_later_to choice.poll, partial: 'polls/poll', locals: { poll: choice.poll, voted: true },
                                            target: choice.poll
  end
end
