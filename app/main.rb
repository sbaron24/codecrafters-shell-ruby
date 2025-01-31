
# Wait for user input

loop do
    $stdout.write("$ ")
    command, *args = gets.chomp.split(" ")
    if command == 'exit' && args.first == '0'
        break
    elsif command == 'echo'
        $stdout.write("#{args.join(" ")}\n")
    elsif command == 'type'
        args.each do |arg|
            if ['echo', 'type', 'exit'].include? arg
                $stdout.write("#{arg} is a shell builtin\n")
            else
                $stdout.write("#{arg}: not found\n")
            end
        end
    elsif command
        $stdout.write("#{command}: command not found\n")
    end
end
