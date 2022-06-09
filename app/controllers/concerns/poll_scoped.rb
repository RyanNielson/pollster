module PollScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_poll
  end

  private

  def set_poll
    @poll = Poll.find_by!(slug: params[:poll_slug])
  end
end
