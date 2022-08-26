class TestController < ApplicationController
  def hello
    render plain: 'Hello World'
  end

  def one
    sleep 1
    render plain: 'This took one second'
  end

  def random
    random = rand(3.0)
    sleep random
    render plain: 'This took some random amount of time 0-3 seconds, this ' \
                  "time it was #{random}"
  end
end
