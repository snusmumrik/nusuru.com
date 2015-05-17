# -*- coding: utf-8 -*-
class ContentsController < ApplicationController
  def index
  end

  def show
    if params[:id] && File.exist?(path = "#{Rails.root.to_s}/app/views/contents/#{params[:id]}.html.haml")
      case params[:id]
      when "index"
        @description = "沖縄県の盗難車情報"
        @keywords = "沖縄県,盗難情報"
      when "rules"
        @description = "ルール・免責事項"
        @keywords = "ルール・免責事項"
      when "faq"
        @description = "よくある質問"
        @keywords = "よくある質問"
      end
      render :file => path, :layout => true
    else
      render :text => "Page does not exists.", :status => 404
    end
  end

  def downloadpdf
    file_name="nusuru.com.pdf"
    filepath = Rails.root.join('public',file_name)
    stat = File::stat(filepath)
    send_file(filepath, filename: file_name, length: stat.size)
  end
end
