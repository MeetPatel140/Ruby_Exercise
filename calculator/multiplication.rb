module MultiplicaitonModule
  class Multiplicaiton
    def Multiplicaiton.logic(value1,value2)
      result = value1 * value2
    end

    def Multiplicaiton.start
      loop do
        puts ""
        print "Enter Value 1 : "
        var1 = gets.chomp.to_f
        print "Enter Value 2 : "
        var2 = gets.chomp.to_f
        puts "Multiplication Done: #{var1} * #{var2} = #{Multiplicaiton.logic(var1,var2)}"
        puts ""
        puts "Would you like to continue? (y/n)"
        response = gets.chomp.downcase
        if response == "y" || response == "yes"
          Multiplicaiton.start
        elsif response == "n" || response == "no"
          MyApp.start
        else
          puts "Invalid Input !"
          Multiplicaiton.start
        end
      end
    end
  end
end
