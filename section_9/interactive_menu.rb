@students = [] # an empty array accessible to all methods

def print_menu
  puts "Please choose from the following options:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to an exisiting file"
  puts "4. Load the list from an exisiting file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def input_students
  puts "Please enter the names of the students"
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
      puts "Now we have #{@students.count} students"
      #get another name from the user
      puts "Please enter another name"
      name = STDIN.gets.chomp
  end
  puts "#{@students.count} students stored in memory - press option 3 to save to disk"
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
         puts "Which file would you like to save these students in?"
         # gets.chomp is the argument then used in 'save_students' method
        save_students(STDIN.gets.chomp)
    when "4"
        # Ask user which file to load
        puts "What file would you like to load?"
        # gets.chomp is the argument then used in 'load_students' method
        load_students(STDIN.gets.chomp)
    when "9"
        exit
    else
        puts "I don't know what you mean, try again"
    end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(file_to_save)
    # open the file for writing ('w' opens it in write-only mode)
    # replace 'students.csv' with any file and write into it
    file = File.open(file_to_save, "w")
    # iterate over the array of students
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
    puts "#{@students.count} students now saved in #{file_to_save}"
end

# 'filename' specified by user input during 'process' method
def load_students(file_to_load)
    # loads students in file specified by user
  file = File.open(file_to_load, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort}
  end
  file.close
  puts "Loaded #{@students.count} students from #{file_to_load}"
end

=begin
# As files loaded & saved now specified, method below isn't needed
def try_load_students
  filename = ARGV.first# first argument from the command line
  return load_students if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
=end

interactive_menu

# To load with specific file, type 'ruby interactive_menu.rb filename.type' into terminal