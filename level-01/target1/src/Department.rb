#!/usr/bin/env ruby
class Department
  attr_accessor :deptname,:sect,:stulist,:deptroll
  def initialize(name)
   self.deptname=name
   self.sect={'A'=>10,'B'=>10,'C'=>10}
   self.stulist={}
  end
  def show
   puts self.deptname
  end
  def show_details
   stulist.keys.sort.each { |key| }
   stulist.each do |key,val|
    puts "#{key} has rollno #{val}"
   end
  end
  def get_details(stuname)
   stulist[stuname]
  end
  def get_dept_name
   deptname
  end
  def enrolls(stuname,rollno)
   stulist[stuname]=rollno
   puts stulist[stuname]
  end
  def remove_rollno(stuname)
   roll=stulist[stuname]
   stulist.delete(stuname)
   self.stulist.each do |key,val|
    if (val[0]+val[1])>(roll[0]+roll[1])
     if(val[1]==1)
      val[1]=0
      val[0]=9
     else
      val[0]-=1
     end
    end
   end
  end
  def get_seats(section)
    self.sect(section)
  end
  def get_rollno(section)
   sec=3-self.sect[section]+1
   sec=section+sec.to_s
   self.sect-=1
   return sec
  end
  def get_section
   if self.sect['A']>=1
    sec=10-self.sect['A']+1
    sec='A'+sec.to_s
    self.sect['A']-=1
   elsif self.sect['B']>=1
    sec=10-self.sect['B']+1
    sec='B'+sec.to_s
    self.sect['B']-=1
   elsif self.sect['C']>=1
    sec=10-self.sect['C']+1
    sec='C'+sec.to_s
    self.sect['C']-=1
   else
    sec=0
   end
   return sec
  end
end