# -*- coding: utf-8 -*-
class ContentsController < ApplicationController
  def index
  end

  def show
    if params[:id] && File.exist?(path = "#{Rails.root.to_s}/app/views/contents/#{params[:id]}.html.haml")
      case params[:id]
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
end
