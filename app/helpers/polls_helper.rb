module PollsHelper
  def choice_percentage(choice)
    number_to_percentage(choice.votes_count.to_f / choice.poll.total_votes_count * 100, precision: 0)
  end
end
