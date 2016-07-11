  # Load csv library/gem - need to require 'csv' in program
  require 'csv'
@students = [] # an empty array accessible to all methods

def print_menu
  puts "\nPlease choose from the following options:\n\n"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to an existing file"
  puts "4. Load a list from an existing file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def input_students
  puts "\nPlease enter the names of the students"
  #get the first name
  name = STDIN.gets.chomp
  #get the first cohort
  #while the name is not empty, repeat this code
  while !name.empty? do
      #add the student hash to the array
      puts "Please enter their cohort"
      cohort = STDIN.gets.chomp
      puts "To finish, just hit return twice"
      @students << {name: name, cohort: cohort}
      puts "\nNow we have #{@students.count} students"
      #get another name from the user
      puts "Please enter another name or hit return twice to finish"
      name = STDIN.gets.chomp
  end
  puts "#{@students.count} students stored in memory - choose option 3 to save to disk"
end

def interactive_menu
    #infinite loop
    loop do
        print_menu
        # gets.chomp is the argument then used in 'process' method
        process(STDIN.gets.chomp)
    end
end

def show_students
    print_header
    print_students_list
    print_footer
end

def process(selection)
    case selection
    when "1"
        input_students
    when "2"
        show_students
    when "3"
        # Ask user which file to save
         puts "\nWhich file would you like to save these students in?"
         # gets.chomp is the argument then used in 'save_students' method
        save_students(STDIN.gets.chomp)
    when "4"
        # Ask user which file to load
        puts "\nWhat file would you like to load?"
        # gets.chomp is the argument then used in 'load_students' method
        load_students(STDIN.gets.chomp)
    when "9"
        exit
    else
        puts "\nI don't know what you mean, please try again"
    end
end

def print_header
  puts "\nThe students of Villains Academy"
  puts "-------------"
end

def print_students_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
  puts "\nOverall, we have #{@students.count} great students"
end

# NEW SAVE METHOD WORKS
# 'file_to_save' specified by user input during 'process' method
def save_students(file_to_save)
  # open & write ('a+' - append on next line) to file using CSV library & code block
    CSV.open(file_to_save, "a+") do |file|
    # iterate over the array of arrays
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      # csv_line = student_data.join(",")
      #file.puts csv_line
      file.puts student_data
    end
  # No need for file.close as file closes when block ends    
  end
    puts "\nSaved #{@students.count} students to #{file_to_save} file"
end

# 'file_to_load' specified by user input during 'process' method
def load_students(file_to_load)
  # Open & close file non-manually using CSV library and code block
  CSV.open(file_to_load, "r") do |file|
    file.readlines.map do |array|
      # get name & cohort from array of arrays using parallel assignment
      name, cohort = array[0], array[1]
      @students << {name: name, cohort: cohort}
      end
    # No need for file.close as file closes when block ends
  end
  puts "\nLoaded #{@students.count} students from #{file_to_load}"
end

interactive_menu

# To load with specific file, type 'ruby interactive_menu.rb filename.type' into terminal