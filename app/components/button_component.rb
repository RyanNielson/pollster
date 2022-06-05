# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(href: nil, type: nil, form: nil, full: false)
    @href = href
    @type = type
    @form = form
    @full = full
  end

  private

  def classes
    "transition-all text-lg hover:translate-x-0.5 hover:translate-y-0.5 hover:shadow-opaque-1 active:translate-x-2 active:translate-y-2 active:shadow-none text-lg rounded-md border-4 border-black shadow-opaque-2 bg-blue-500 hover:bg-blue-700 text-white text-base font-bold py-2 px-4 #{@full && 'w-full'}"
  end
end
