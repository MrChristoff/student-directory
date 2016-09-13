@students = []

def interactive_menu
 # @students = []
  loop do 
    print_menu
    process(gets.chomp)
   end
end

def process(selection)
	case selection
    when "1" 
      @students = input_students_with_ammend
    when "2"
      show_students
  	when "3"
  	  save_students
  	when "4"
  	  load_students
    when "9"
      exit #terminate program
    else
      puts "I don't know what you meant, try again" 
    end
end

def print_menu
	puts "\n"
	puts "Villans Academy Student Entry System".center(100)
	puts "\n"
	puts "1. Input the students".center(100)
  puts "2. Show the students".center(100)
  puts "3. Save student list to 'students.csv'".center(100)
  puts "4. Load the list from 'students.csv'".center(100)
  puts "9. Exit".center(100)
end

def save_students
	# open (or create) a file for writing
	file = File.open("students.csv", "w")

	# iterate the array of students
	@students.each do |student| 
	  student_data = [student[:Name], student[:Cohort]]
	  csv_line = student_data.join(",") 
	  file.puts csv_line
	end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line| 
  name, cohort = line.chomp.split(',')
    @students << {Name: name, Cohort: cohort.to_sym}
  end
  file.close
end

def show_students
	print_header
	print_without_each
	print_footer
end




def input_students_non_iteractive
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  #students = []
  # gets the first students name
  name = gets[0...-1]
  # while the name is not empty, repeat this code:
  while !name.empty? do
    # add the student hash to the array
    student_template = students << {Name: name, Cohort: :november, Hobbie: "being evil", Gender: "prefer not to say"} 
    students.count == 1 ? plural_or_single = "student" : plural_or_single = "students"
    puts "Now we have #{students.count} #{plural_or_single}"
    # get another name from the user
    name = gets[0...-1]
  end
  # return the array of students
  @students
end

def input_students_interactive
  puts "Please enter the details of the student(s)"
  continue = true
  @students # = []
  while continue == true do
    # add the student hash to the array
    student_template = {Name: "To be confirmed", Cohort: :November, Hobbie: "To be confirmed", Gender: "To be confirmed"} 
    student_template.each do |key, value| # itterates the 'template' hash assigning the new value to the key selected
      puts "Please enter a #{key}"
      new_value = gets.chomp.capitalize.to_sym
      student_template[key] = new_value if new_value != :""
    end

    @students << student_template
    @students.count == 1 ? plural_or_single = "student" : plural_or_single = "students"
    puts "Now we have #{students.count} #{plural_or_single}"
    puts "continue to add students? Y/N"
    gets.chomp.upcase == "Y" ? continue = true : continue = false

  end
  # return the array of students
  @students
end

def input_students_with_ammend
  puts "Please enter the details of the student(s)"
  continue = true
  @students # = []
  while continue == true do
    # add the student hash to the array
    student_template = {Name: "To be confirmed", Cohort: :November, Hobbie: "To be confirmed", Gender: "To be confirmed"} 
    student_template.each do |key, value| # itterates the 'template' hash assigning the new value to the key selected
      puts "Please enter a #{key}"
      new_value = gets.chomp.capitalize.to_sym
      student_template[key] = new_value if new_value != :""
    end
    # add template to student array
    @students << student_template
    student = @students[-1]
    # check informatin is correct
    puts "Please check this information is correct:"#.center(100)
    puts ""
    puts "#{student[:Name]} (#{student[:Cohort]} Cohort) Hobby: #{student[:Hobbie]}, Gender: #{student[:Gender]}.\n"#.center(100)
    puts ""
    puts "would you like to delete the student and data?"
    puts "Type 'R' to remove student data or any key to continue"
    answer = gets.chomp.capitalize
    @students.pop if answer == "R" 


    @students.count == 1 ? plural_or_single = "student" : plural_or_single = "students"
    puts "Now we have #{@students.count} #{plural_or_single}"
    puts "continue to add students? Y/N"
    gets.chomp.upcase == "Y" ? continue = true : continue = false

  end
  # return the array of students
  @students
end

def print_header
  puts "The students of Villans Academy".center(100)
  puts "_____________".center(100)
end


def print_student_list#(students)
  # students = 
  @students.each_with_index do |student, index|
      puts "#{index + 1}.#{student[:Name]} (#{student[:Cohort]} Cohort)".center(100)
  end
end


def print_students_begining_with#(students) # only print students whos names begin with "D" or "d"
  #students = 
  @students.each_with_index do |student, index|
  	if (student[:Name])[0] == "D" || (student[:Name])[0] == "d"
  		puts "#{index + 1}.#{student[:Name]} (#{student[:Cohort]} Cohort)"
  		end
  	end
end

def print_students_with_names_less_than#(students) # only print students who's names are shorter than 12 characters
  #students = 
  @students.each_with_index do |student, index|
  	if (student[:Name]).length < 12 
  		puts "#{index + 1}.#{student[:Name]} (#{student[:Cohort]} Cohort)"
  		end
  	end
end

def print_without_each#(arr) # print without using the 'each' method, and use loop instead
  n = 0
  until n == @students.length
    student = @students[n]
    puts "#{n + 1}.#{student[:Name]} (#{student[:Cohort]} Cohort) Hobby: #{student[:Hobbie]} Gender: #{student[:Gender]}".center(100)
    n += 1
  end
end

def print_by_cohort#(student_arr)
  puts @students.group_by {|student| student[:cohort]}.sort
end

def print_footer#(names)
	@students.count == 1 ? plural_or_single = "student" : plural_or_single = "students"
  puts "Overall, we have #{@students.count} great #{plural_or_single} ".center(100)
  puts "******************".center(100)
  puts ""
end

# nothing happens until we call the mothods
#input_students_with_ammend
interactive_menu
print_header
print_without_each#(students)
print_footer#(students)
print_by_cohort#(stude)
