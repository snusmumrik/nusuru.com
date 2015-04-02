# -*- coding: utf-8 -*-
class ReplyMailer < ApplicationMailer
  def new_reply_email(reply)
    @reply = reply
    mail(to: @reply.post.user.email, subject: "【ヌスルー情報局】新しい情報提供がありました")
  end
end
