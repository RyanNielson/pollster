module ChoiceScoped
  extend ActiveSupport::Concern
  include PollScoped

  included do
    before_action :set_choice
  end

  private

  def set_choice
    @choice = @poll.choices.find(params[:choice_id])
  end
end
