
# Wait for user input

def command_dir(arg)
    ENV["PATH"].split(":").each do |dir|
        begin
            if Dir.entries(dir).find { |entry| entry == arg }
                return dir
            end
        rescue
        end
    end

  ""
end

loop do
    $stdout.write("$ ")
    command, *args = gets.chomp.split(" ")
    if command == 'exit'
        break
    elsif command == 'echo'
        $stdout.write("#{args.join(" ")}\n")
    elsif command == 'type'
        args.each do |arg|
            if %w[echo exit type].include? arg 
                $stdout.write("#{arg} is a shell builtin\n")
            else
                dir = command_dir arg
                unless dir.empty?
                    $stdout.write("#{arg} is #{dir}/#{arg}\n")
                else
                    $stdout.write("#{arg}: not found\n")
                end
            end
        end
    elsif command
        $stdout.write("#{command}: command not found\n")
    end
end
