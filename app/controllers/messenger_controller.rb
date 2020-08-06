class MessengerController < ApplicationController
  skip_before_action :verify_authenticity_token

  def inbound
    input = params[:message][:content][:text]
    fb_user = params[:from][:id]
    @current_user = helpers.current_facebook_user(fb_user)

    if @current_user.updated_at < 1.second.ago && @current_user.welcomed == false
      helpers.send_text_only(welcome_message, @current_user.facebook_id)
      @current_user.welcomed = true
      @current_user.save
    end

    if @current_user.last_message_timestamp && @current_user.last_message_timestamp > 1.hour.ago
      helpers.send_text_only(welcome_back_message, @current_user.facebook_id)
      @current_user.last_message_timestamp = Time.now
      @current_user.save
    end

    if @current_user.last_message_timestamp.nil? && @current_user.welcomed == true
      if Banner.exists?(text: input, user_id: @current_user.id)
        head :no_content
        return
      else
        @banner = Banner.generate(input, @current_user)
        sleep 10
        helpers.send_image(@banner, @current_user.facebook_id)
      end
    end

    if @current_user.last_message_timestamp && @current_user.last_message_timestamp < 1.hour.ago

    end

    head :no_content
  end

  def status
    puts params

    head :no_content
  end

  private

  def welcome_message
    <<~HEREDOC
    Welcome to the Facebook Banner Generator! What can you do with this wondrous tool?
    Simply respond to this message with a text message that you would like on your banner.
    The generator will send back to you a banner with some randomly selected colors!
    Enjoy!
    HEREDOC
  end

  def welcome_back_message
    <<~HEREDOC
    Hey there! Welcome back! It's so nice to see you again.
    It looks like you can't get enough of making awesome banners, ay?
    You know the drill. Reply with some text and we'll send you back a banner!
    HEREDOC
  end
end
