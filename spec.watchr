ENV["WATCHR"] = "1"
system 'clear'

def growl(message)
  growlnotify = `which growlnotify`.chomp
  title = "Watchr spec Results"
  image = message.include?('0 failures, 0 errors') ? "~/.watchr_images/passed.png" : "~/.watchr_images/failed.png"
  options = "-w -n Watchr --image '#{File.expand_path(image)}' -m '#{message}' '#{title}'"
  system %(#{growlnotify} #{options} &)
end

def run(cmd)
  puts(cmd)
  `#{cmd}`
end

def run_spec_file(file)
  system('clear')
  result = run(%Q(ruby -I"lib:spec" -rubygems #{file}))
  growl result.split("\n").last rescue nil
  puts result
end

def run_all_specs
  system('clear')
  result = run "bundle exec padrino rake spec"
  growl result.split("\n").last rescue nil
  puts result
end


watch("^lib.*/(.*)\.rb") { |m| run_spec_file("spec/lib/#{m[1]}_spec.rb") }
watch("spec.*/spec_helper\.rb") { run_all_specs }
watch('spec/(.*).*_spec\.rb') { |m| run_spec_file(m[0]) }

# Web specs
watch("^app/controllers/(.*).rb") { |m| run_spec_file("spec/app/controllers/#{m[1]}_controller_spec.rb")}
watch("^app/models/(.*).rb") { |m| run_spec_file("spec/app/models/#{m[1]}_spec.rb")}

# Ctrl-\
Signal.trap 'QUIT' do
  puts " --- Running all specs ---\n\n"
  run_all_specs
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
    run_all_specs
  end
end
