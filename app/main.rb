
# Wait for user input

loop do
    $stdout.write("$ ")
    command, *args = gets.chomp.split(" ")
    if command
        $stdout.write("#{command}: command not found")
        $stdout.write("\n")
    end
end

