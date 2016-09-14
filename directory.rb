@students = []
@file_to_use = ""


def interactive_menu
  loop do 
    print_menu
    process(STDIN.gets.chomp)
   end
end

def print_menu
  puts "\n"
  puts "Villans Academy Student Entry System\n".center(100)
  puts "\n"
  puts "1. Input the students".center(100)
  puts "2. Show the students".center(100)
  puts "3. Save student list to a file".center(100)
  puts "4. Load the list from a file".center(100)
  puts "9. Exit".center(100)
end

def process(selection)
  case selection
  when "1"
    @students = input_students
    when "2"
      show_students
      when "3"
        save_students
        when "4"
          load_students
          when "9"
            exit
            else
              puts "I don't know what you meant, try again"
  end
end
          
def input_students
  puts "Please enter the details of the student(s)"
  continue = true
  while continue == true do
    student_template = {Name: "To be confirmed", Cohort: :November, Campus: :London, Age: "To be confirmed"} 
    student_template.each do |key, value| # itterates the 'template' hash assigning the new value to the key selected
      puts "Please enter a #{key}"
      new_value = STDIN.gets.chomp.capitalize.to_sym
      student_template[key] = new_value if new_value != :""
    end
    @students << student_template

    student_entry_check 

    puts "continue to add students? Y/N"
    STDIN.gets.chomp.upcase == "Y" ? continue = true : continue = false
  end
  @file_to_use = "" # so file selection is prompted after adding new students
  @students
end

def student_entry_check
  student = @students[-1]
  puts "Please check this information is correct:"
  puts ""
  puts "#{student[:Name]} (#{student[:Cohort]} Cohort) Campus: #{student[:Campus]}, Age: #{student[:Age]}.\n"
  puts ""
  puts "would you like to delete the student and data?"
  puts "Type 'R' to remove student data or any key to continue"
  answer = STDIN.gets.chomp.capitalize
  @students.pop if answer == "R" 
  puts "Now we have #{@students.count} #{plural_or_single}"
end

def plural_or_single
  @students.count == 1 ? plural_or_single = "student" : plural_or_single = "students"
end

def show_students
  print_header
  print_without_each
  print_footer
end

def print_header
  puts "The students of Villans Academy".center(100)
  puts "_____________".center(100)
end

def print_without_each#(arr) # print without using the 'each' method, and use loop instead
  n = 0
  until n == @students.length
    student = @students[n]
    puts "#{n + 1}.#{student[:Name]} (#{student[:Cohort]} Cohort) Campus: #{student[:Campus]}. Age: #{student[:Age]}".center(100)
    n += 1
  end
end

def print_footer
  puts "\n"
  puts "Overall, we have #{@students.count} great #{plural_or_single} ".center(100)
  puts "\n"
  puts "******************".center(100)
  puts "\n"
end

# def save_students
#   file_selection if @file_to_use == ""
 
#   file = File.open(@file_to_use, "w")
#   @students.each do |student|
#     student_data = [student[:Name], student[:Cohort], student[:Campus], student[:Age]]
#     csv_line = student_data.join(",") 
#     file.puts csv_line
#   end
#   file.close
#   puts "#{@file_to_use} saved with #{@students.count} #{plural_or_single}".center(100)
#    @file_to_use = "" # so file selection is prompted after adding new students
# end

def save_students
  file_selection if @file_to_use == ""

  File.open(@file_to_use, "w") do |file|
    @students.each do |student|
      student_data = [student[:Name], student[:Cohort], student[:Campus], student[:Age]]
      csv_line = student_data.join(",") 
      file.puts csv_line
    end
  end
  puts "#{@file_to_use} saved with #{@students.count} #{plural_or_single}".center(100)
  @file_to_use = "" # so file selection is prompted after adding new students
end


# def try_load_students
#   ARGV.empty? ? (load_students):(filename = ARGV.first)
#   return if filename.nil?
#   if File.exists?(filename)
#     load_students(filename)
#      puts "Loaded #{@students.count} from #{filename}."
#   else
#     puts "Sorry, #{filename} does not exist."
#     exit
#   end
# end

def file_selection
  puts "Here is a list of available files".center(100)
  puts "\n"
  Dir["*"].each_with_index do |f, index|
  puts "#{index + 1} -> #{f}".center(100)
    end
    puts "\n"
  puts "please type the number of a file you would like to use".center(100)
  puts "or type a new file name to create a new file".center(100)

  user_input = STDIN.gets.chomp

  if user_input.to_i > 0
    @file_to_use = Dir["*"][user_input.to_i - 1]
    puts "\n"
    puts "Selected file: #{@file_to_use}".center(100)
    puts "\n"
  else
    @file_to_use = user_input + ".csv"
    puts "New file wil be '#{@file_to_use}'.".center(100)
  end
  @file_to_use
end


# def load_students(filename = "students.csv")
#   file = File.open("students.csv", "a+")
#   file.readlines.each do |line| 
#   name, cohort = line.chomp.split(',')
#     @students << {Name: name, Cohort: cohort.to_sym}
#   end
#   file.close
#   print_footer
# end

def load_students
  file_selection if @file_to_use == ""

  File.open(@file_to_use, "a+") do |file|
    file.readlines.each do |line|
      name, cohort, campus, age = line.chomp.split(',')
      @students << {Name: name, Cohort: cohort.to_sym, Campus: campus.to_sym, Age: age}
    end
  end

  print_footer
  @file_to_use = "" # so file selection is prompted after adding new students
end

# def print_student_list
#   @students.each_with_index do |student, index|
#       puts "#{index + 1}.#{student[:Name]} (#{student[:Cohort]} Cohort)".center(100)
#   end
# end

def print_students_begining_with# only print students whos names begin with "D" or "d"
  @students.each_with_index do |student, index|
    if (student[:Name])[0] == "D" || (student[:Name])[0] == "d"
      puts "#{index + 1}.#{student[:Name]} (#{student[:Cohort]} Cohort)"
    end
  end
end

def print_students_with_names_less_than # only print students who's names are shorter than 12 characters
  @students.each_with_index do |student, index|
    if (student[:Name]).length < 12 
      puts "#{index + 1}.#{student[:Name]} (#{student[:Cohort]} Cohort)"
    end
  end
end

def print_by_cohort
  puts @students.group_by {|student| student[:cohort]}.sort
end

#  nothing happens until we call the mothods
# try_load_students
interactive_menu