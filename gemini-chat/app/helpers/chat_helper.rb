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
    prettified_message = markdown_to_html(message.content).html_safe
    ''.html_safe + time_preamble + ' ' + user_preamble + ' ' + content_tag(:span, prettified_message)
  end

  # todo cache or construct in config initializer
  def markdown_to_html(source_text)
    renderer = Redcarpet::Render::HTML.new(prettify: true)
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    #html = markdown.render(source_text)
    markdown.render(source_text)
  end
end
