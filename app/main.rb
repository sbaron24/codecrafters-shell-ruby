
# Wait for user input

loop do
    $stdout.write("$ ")
    command, *args = gets.chomp.split(" ")
    if command == 'exit' && args.first == '0'
        break
    elsif command == 'echo'
        $stdout.write(args.join(" "))
        $stdout.write("\n")
    elsif command
        $stdout.write("#{command}: command not found")
        $stdout.write("\n")
    end
end
