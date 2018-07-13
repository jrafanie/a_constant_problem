2.times do
  Thread.new do
    `curl -k -L http://localhost:3000/ping`
  end
end
