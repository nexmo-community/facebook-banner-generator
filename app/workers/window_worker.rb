require 'open3'

class WindowWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(text, user_id)
    Open3.popen3("rails runner app/scripts/ruby2d.rb '#{text}' #{user_id}")
  end
end