# frozen_string_literal: true
mutex = Mutex.new

first_thread = Thread.new do
  (1..10).each do |i|
    mutex.synchronize do
      puts "Thread 1: #{i}"
      sleep 0.1
    end
  end
end

second_thread = Thread.new do
  (1..10).each do |i|
    mutex.synchronize do
      puts "Thread 2: #{i}"
      sleep 0.1
    end
  end
end

first_thread.join
second_thread.join