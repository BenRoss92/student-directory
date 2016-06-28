def input_students
    
  puts "Please enter the name of the student"
  #get the first name
  name = gets.chomp
  #get the first cohort
  puts "Please enter their cohort"
  cohort = gets.chomp
  puts "To finish, just hit return twice"
  #create empty array for students
  students = []
  #while the name is not empty, repeat this code
  while !name.empty? do
      #add the student hash to the array
      #added cohort variable into each hash
      students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} students"
      #get another name from the user
      name = gets.chomp
      #get another cohort from the user
      cohort = gets.chomp
  end
  #return the array of students
  students
end

#students = [{name: "Ben", cohort: "July"}, {name: "Tim", cohort: "March"}, {name: "Gary", cohort: "August"}]

def print_cohorts(students)
# 1. Create an empty array of cohorts
  cohorts = []
# 2. Iterate over original array
  students.each do |student|
    # grab each month and put into new cohorts array
    cohorts << student[:cohort]
  end
  # select each cohort month
  cohorts.uniq.select do |cohort_group|
    puts cohort_group + ":"
    students.each do |student|
      if student[:cohort] == cohort_group
        puts student[:name]
      end
    end
  end
end

# try to use .map?
# students looks like: [{Jonathan, July}, {Benjamin, August}, {Tim, May}]
# cohorts looks like: ["July", "August", "May"]
  
def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

=begin
# Old working code:
def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end
=end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print_cohorts(students)
print_footer(students)