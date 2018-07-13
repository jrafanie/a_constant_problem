
class Ping < ApplicationRecord
  include Pong

  def ping
    "pong"
  end
end
