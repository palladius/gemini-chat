module ChatHelper

  # ideally, Mac way, color green blue you and others. Plus color GRAY or purple/blue gemini bot.
  # Msg: the msg objkect
  # User: the use rpoint of view, usually current_user.
  def render_fancy_chat_message(message: , user: )
    # message.room.is_private
    time_preamble = message.created_at.strftime("%H:%M")
    user_preamble = message.user == user ?
      ' 🫵 ' : message.room.is_private ?
              ' 🤫 ' : # 🤐
              link_to(message.user.username, message.user).html_safe
    # This ensures we stay a SafeBuffer class: https://stackoverflow.com/questions/65234856/html-safe-and-non-html-safe-concatenation
    ''.html_safe + time_preamble  + user_preamble + message.to_s
  end
end
