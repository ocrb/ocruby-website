ENV["WATCHR"] = "1"
system 'clear'

def growl(message)
  growlnotify = `which growlnotify`.chomp
  title = "Watchr Test Results"
  image = message.include?('0 failures, 0 errors') ? "~/.watchr_images/passed.png" : "~/.watchr_images/failed.png"
  options = "-w -n Watchr --image '#{File.expand_path(image)}' -m '#{message}' '#{title}'"
  system %(#{growlnotify} #{options} &)
end

def run(cmd)
  puts(cmd)
  `#{cmd}`
end

def run_test_file(file)
  system('clear')
  result = run(%Q(ruby -I"lib:test" -rubygems #{file}))
  growl result.split("\n").last rescue nil
  puts result
end

def run_all_tests
  system('clear')
  result = run "bundle exec padrino rake test"
  growl result.split("\n").last rescue nil
  puts result
end


watch("^lib.*/(.*)\.rb") { |m| run_test_file("test/lib/#{m[1]}_test.rb") }
watch("test.*/test_config\.rb") { run_all_tests }
watch('test/(.*).*_test\.rb') { |m| run_test_file(m[0]) }

# Web Tests
watch("^app/controllers/(.*).rb") { |m| run_test_file("test/app/controllers/#{m[1]}_controller_test.rb")}
watch("^app/models/(.*).rb") { |m| run_test_file("test/app/models/#{m[1]}_test.rb")}

# Ctrl-\
Signal.trap 'QUIT' do
  puts " --- Running all tests ---\n\n"
  run_all_tests
end

@interrupted = false

# Ctrl-C
Signal.trap 'INT' do
  if @interrupted then
    @wants_to_quit = true
    abort("\n")
  else
    puts "Interrupt a second time to quit"
    @interrupted = true
    Kernel.sleep 1.5
    @interrupted = false
    # raise Interrupt, nil # let the run loop catch it
    run_all_tests
  end
end


