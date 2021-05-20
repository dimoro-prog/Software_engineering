if File.exists?("/home/den/Software/balance.txt")
    file = File.open("/home/den/Software/balance.txt")
    balance = file.read
    file.close
else
    balance = 100
end

balance = balance.to_i
loop do
    puts("Какую операцию хотите выполнить?")
    puts("D-депозит")
    puts("W-снять деньги")
    puts("B-проверить баланс")
    puts("Q-выход")

    choice = gets.chomp
    
    case choice.upcase
    when "D"
        puts("Взять в депозит #{balance*2+100} рублей?")
        puts("Y - да, N - нет")
        choice = gets.chomp.upcase
        if choice == "Y"
            balance = balance+balance*2+100
            puts("Баланс изменён")
        elsif choice == "N"
            puts("Баланс не изменён")
        else
            puts("Введён неправильный символ")
        end
    when "W"
        puts("Какую сумму снять с баланса?")
        w = gets.to_i
        if w>balance 
            puts("Недостаточно средств")
        else
            balance = balance-w
            puts("Средства сняты с баланса")
        end
    when "B"
        puts(balance)
    when "Q"
        file = File.open("/home/den/Software/balance.txt","w")
        file.write(balance)
        file.close
        break
    else 
        puts("Введите нужный символ")
    end
end