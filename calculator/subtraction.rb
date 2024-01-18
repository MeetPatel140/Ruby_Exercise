module SubtractionModule
  class Subtraction
    def Subtraction.logic(value1,value2)
      result = value1 - value2
    end

    def Subtraction.start
      loop do
        puts ""
        print "Enter Value 1 : "
        var1 = gets.chomp.to_f
        print "Enter Value 2 : "
        var2 = gets.chomp.to_f
        puts "Subtraction Done: #{var1} - #{var2} = #{Subtraction.logic(var1,var2)}"
        puts ""
        puts "Would you like to continue? (y/n)"
        response = gets.chomp.downcase
        if response == "y" || response == "yes"
          Subtraction.start
        elsif response == "n" || response == "no"
          MyApp.start
        else
          puts "Invalid Input !"
          Subtraction.start
        end
      end
    end
  end
end
