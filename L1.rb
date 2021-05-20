def authorization 
    puts "Введите фамилию"
    surname = gets.chomp 
    puts "Введите имя"
    name = gets.chomp
    puts "Введите возраст"
    age = gets.to_i

        if age < 18
            print "Дорогой, #{surname} #{name}, вы ещё слишком малы для входа"
            puts
        else
            puts "Добро пожаловать, #{surname} #{name}"
            puts
        end
    
end

def check 
    puts "Введите первое число"
    first = gets.to_i
    puts "Введите второе число"
    second = gets.to_i

    if (first == 20)||(second == 20)
        puts 20
    else
        puts first+second
    end
end

def menu
    loop do
        puts "1 - Проверка скрипта на приветствие"
        puts "2 - Проверка скрипта на сравнение чисел"
        puts "-1 - Выход из программы"
        number = gets.to_i
        if number == 1 
            authorization()
        elsif number == 2
            check()
        end
        break if number == -1
        
        if (number>2)||(number<-1)
        puts "Команды с данным номером нет, попробуйте ещё раз"
        end
    end
end

menu()