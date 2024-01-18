module AdditionModule
  class Addition
    def Addition.logic(value1,value2)
      result = value1 + value2
    end

    def Addition.start
      loop do
        puts ""
        print "Enter Value 1 : "
        var1 = gets.chomp.to_f
        print "Enter Value 2 : "
        var2 = gets.chomp.to_f
        puts "Addition Done: #{var1} + #{var2} = #{Addition.logic(var1,var2)}"
        puts ""
        puts "Would you like to continue? (y/n)"
        response = gets.chomp.downcase
        if response == "y" || response == "yes"
          Addition.start
        elsif response == "n" || response == "no"
          MyApp.start
        else
          puts "Invalid Input !"
          Addition.start
        end
      end
    end
  end
end
