module DivisionModule
  class Division
    def Division.logic(value1,value2)
      result = value1 / value2
    end

    def Division.start
      loop do
        puts ""
        print "Enter Value 1 : "
        var1 = gets.chomp.to_f
        print "Enter Value 2 : "
        var2 = gets.chomp.to_f
        puts "Division Done: #{var1} / #{var2} = #{Division.logic(var1,var2)}"
        puts ""
        puts "Would you like to continue? (y/n)"
        response = gets.chomp.downcase
        if response == "y" || response == "yes"
          Division.start
        elsif response == "n" || response == "no"
          MyApp.start
        else
          puts "Invalid Input !"
          Division.start
        end
      end
    end
  end
end
