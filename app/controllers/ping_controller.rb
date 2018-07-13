class PingController < ApplicationController
  def index
    self.class.things
  end

  def self.things
    5000.times do |i|
      s = Set.new
      keys = "Foo#{i}".constantize.columns_hash.keys
      s << keys
    end
  end
end
