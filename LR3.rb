require 'fileutils'

file = File.open("/home/den/Software/lr3.txt")
file_data = file.readlines
file.close

i = 0;
file_data.size().times do
    file_data[i] = file_data[i].split(" ");
    i = i+1;
end

loop do
    puts("Введите возраст для сравнения, если отрицательный, то выход из системы.")
    age = gets.to_i
    if age<0
        if age ==-1 || FileUtils.compare_file("/home/den/Software/lr3.txt", "/home/den/Software/results.txt") 
            file = File.open("/home/den/Software/results.txt")
            file_data = file.read
            puts(file_data)
            file.close
        end
      break
    end
    file = File.open("/home/den/Software/results.txt","w")
    i = 0
    file_data.size().times do
        if file_data[i][2].to_i == age 
            file.write(file_data[i].to_s + "\n")
        end
        i = i+1;
    end
    file.close
end