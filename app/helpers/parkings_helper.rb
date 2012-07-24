#!/bin/env ruby
# encoding: utf-8
module ParkingsHelper
  def select_tag_24_option(selected)

    a=(-1..23).map do  |i|
      if i==-1
        "<option value=''>выбрать</option>"
      else
        if selected==i.to_s
          "<option value='#{i}' selected>#{i} ч.</option>"
        else
          "<option value='#{i}'>#{i} ч.</option>"
        end
      end
    end
    a.join("")
  end
end
