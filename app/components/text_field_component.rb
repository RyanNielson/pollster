# frozen_string_literal: true

class TextFieldComponent < ViewComponent::Base
  def initialize(form:, method:)
    @form = form
    @method = method
  end
end
