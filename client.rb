#!/usr/bin/env ruby
require 'socket'
require './app.rb'
class Client
  def initialize(server)
    @server = server
    @request = nil
    @response = nil
    listen
    send
    @request.join
    @response.join
  end

  def listen
    @response = Thread.new do
      loop {
        msg = @server.gets.chomp
        puts "#{msg}"
      }
    end
  end

  def send
    puts "Enter your username:"
    @request = Thread.new do
      loop {
        msg = $stdin.gets.chomp
        @server.puts(msg)
        Game.new.start!
      }
    end
  end 
end

server = TCPSocket.open("localhost", 3000)
Client.new(server)