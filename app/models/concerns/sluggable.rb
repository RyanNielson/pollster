module Sluggable
  extend ActiveSupport::Concern

  included do
    before_validation :generate_slug
  end

  protected

  def generate_slug
    return unless slug.nil?

    self.slug = "#{Faker::Adjective.positive}-#{Faker::Creature::Animal.name}-#{Faker::Number.number(digits: 4)}".parameterize
  end
end
