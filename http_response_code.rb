#!/usr/bin/env ruby
#
# Scott Goyette
# 2018-09-11
# scott_goyette@comcast.com, scott.goyette@rubypythmore.com
# HTTP Response
# Sends HTTP request returns HTTP code
# Implementation use case:
# Heroku apps like to sleep, sidekiq this to keep them FREE dynos awake
# Dashboard the response codes so you always know sites are up

require 'net/http'

class ResponseCode

  def http_response_code(host)
    address = URI.parse(host)
    request = Net::HTTP::Get.new(address.to_s)
    response = Net::HTTP.start(address.host, address.port) {|http|
      http.request(request)
    }
    response.code
  end
end


@code = ResponseCode.new
puts 'Enter A website to return its HTTP code (sample format: http://google.com)'
http_host = gets.chomp
puts @code.http_response_code(http_host)
