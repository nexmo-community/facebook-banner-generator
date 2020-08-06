require 'color-generator'

class Banner < ApplicationRecord
  serialize :colors, Array
  belongs_to :user

  def self.generate(text, user)
    WindowWorker.new.perform(text, user.id)

    "banner-#{user.id}.png"
  end
end
