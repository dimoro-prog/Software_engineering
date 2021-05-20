class CashMachine

    def initialize()
        if File.exists?("/home/den/Software/balance.txt")
            file = File.open("/home/den/Software/balance.txt")
            @balance = file.read
            file.close
        else
            @balance = 100
        end
        @balance=@balance.to_i
    end 
    def deposit()
        puts("Взять в депозит #{@balance*2+100} рублей?")
        puts("Y - да, N - нет")
        choice = gets.chomp.upcase
        if choice == "Y"
            @balance = @balance+@balance*2+100
            puts("Баланс изменён")
        elsif choice == "N"
            puts("Баланс не изменён")
        else
            puts("Введён неправильный символ")
        end
    end
    def withdraw()
        puts("Какую сумму снять с баланса?")
        w = gets.to_i
        if w>@balance 
            puts("Недостаточно средств")
        else
            @balance = @balance-w
            puts("Средства сняты с баланса")
        end
    end
    def balance()
        puts(@balance)
    end
    def save()
        file = File.open("/home/den/Software/balance.txt","w")
        file.write(@balance)
        file.close
    end
    def init()
        initialize()
        loop do
            puts("Какую операцию хотите выполнить?")
            puts("D-депозит")
            puts("W-снять деньги")
            puts("B-проверить баланс")
            puts("Q-выход")
        
            choice = gets.chomp
            
            case choice.upcase
            when "D"
                deposit()
            when "W"
                withdraw()
            when "B"
                balance()
            when "Q"
                save()
                break
            else 
                puts("Введите нужный символ")
            end
        end
    end
end

cash = CashMachine.new
cash.init()
