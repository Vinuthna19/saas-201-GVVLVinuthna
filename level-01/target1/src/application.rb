
 require './Department' # Include other files in the same directory

# Your application
class Application
   attr_accessor :departments

  def initialize
     self.departments = ['EEE', 'MECH', 'CSE', 'CIVIL'].each { |dept| Department.new(dept) }
     ['EEE', 'MECH', 'CSE', 'CIVIL'].each do |dept| 
      self.departments<<Department.new(dept) 
    end
  end
  def enroll(student_name, student_department)
    # This is a sample implementation. you can write your own code
     department=self.departments.detect { |dept| dept.get_dept_name == student_department}
     sect=department.get_section
     s=sect[0]
     rno=sect[1]+set[2]
     roll=department.get_dept_name+sect
     department.enrolls(student_name,rno)
     puts "You have been enrolled to #{student_department}" \
          "\nYou have been allotted section #{s}" \
          "\nYour roll number is #{roll}"
  end

  def change_dept(student_name, student_department)
    ## write some logic to frame the string below
    sect=student_department.get_section
    if sect!=nil
     department=self.departments.detect { |dept| dept.get_dept_name==student_department }
     sect=department.get_section
     s=sect[0]
     rno=sect[1]+set[2]
     rno=department.getname+sect
     department.enroll(student_name,rno)
     roll=""
     self.departments.each do |dept|
      roll=dept.get_details(student_name)
      if roll!=nil
       dept.remove_rollno(student_name)
      end
     end      
     "You have been enrolled to #{student_department}" \
     "\nYou have been allotted section #{sect[0]}" \
     "\nYour roll number is #{rno}"
    else
     puts "department has no vacancy\n"
    end
  end   
  def change_section(student_name, section)
    ## write some logic to frame the string below
    "You have been allotted section #{section}" \
    "\nYour roll number is MECB01"
  end

  def department_view(student_dept)
    ## write some logic to frame the string below
    puts "List of students:"
    student_dept.stulist.each do |key,val|
     puts "\n#{key} - #{val}"
    end
  end

  def section_view(student_dept, section)
    ## write some logic to frame the string below
    puts "List of students:"
    student_dept.stulist.each do |key,val|
     if val[0]==section
      puts "\n#{key} - #{val}"
     end
    end
  end

  def student_details(student_name)
    ## write some logic to frame the string below
    departments.each do |dept|
     rno=dept.get_details(student_name)
     sect=rno[0]
     roll=rno[1]+rno[2]
     puts "#{student_name} - #{sect} - Section #{dept+roll}"
    end    
    ##"Tom - MECH - Section B - MECB01"
  end
end
