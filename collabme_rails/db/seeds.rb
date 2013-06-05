# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Researchers
ss = Researcher.new(:first_name => "Shayon", :last_name => "Saleh", :email => "ssaleh@stanford.edu", :password => "collabme13", :password_confirmation => "collabme13")
ss.password = "collabme13"
ss.about_me = "I love research collaboration!"
ss.experience = "Java, C++, Python, Rails"
ss.publications = "Inference of Tumor Phylogenies with Improved Somatic Mutation Discovery"
ss.save()

kg = Researcher.new(:first_name => "Kristian", :last_name => "Gampong", :email => "kgampong@stanford.edu", :password => "collabme13", :password_confirmation => "collabme13")
kg.password="collabme13"
kg.save()

gk = Researcher.new(:first_name => "Gavin", :last_name => "Kho", :email => "gdykho@stanford.edu", :password => "collabme13", :password_confirmation => "collabme13")
gk.password="collabme13"
gk.save(:validate => false)

jt = Researcher.new(:first_name => "Jonathan", :last_name => "Tatum", :email => "jdtatum@stanford.edu", :password => "collabme13", :password_confirmation => "collabme13")
jt.password="collabme13"
jt.save(:validate => false)

ss2 = Researcher.new(:first_name => "Syed", :last_name => "Saleh", :email => "shayonsaleh@yahoo.com", :password => "collabme13", :password_confirmation => "collabme13")

# Projects
pj = Project.new(:name => "CollabMe", :description => "GroupProject Page! Woo and hoo.")
pj.owner = ss;
pj.members << gk << kg << jt;
pj.save()

# Requests
r = Request.new()
r.owner = ss2
pj.requests << r
r.save()

ss.direct_friends << kg << gk << jt;
kg.direct_friends << gk << jt; 
gk.direct_friends << jt; 

# Tasks
t = Task.new(:desc => "Woo a task!!!", :category => 1);
t.project=pj;
t.category = 1; 
t.creator = jt; 
t.save();

# Posts
p = Post.new(:title=>"comment", :desc => "What an awesome project!!!")
p.creator = ss
pj.posts << p    

p2 = Post.new(:title=>"status", :desc => "I love CollabMe!")
p2.creator = ss
ss.posts << p2

# Groups
g = Group.new(:name => "cs194", :email => "don't_email@me.com")
g.researchers << ss
g.save();

# Companies
company1 = Company.new
company1.name = 'Google'
company1.location = 'Mountain View, CA'
company1.save

company2 = Company.new
company2.name = 'Facebook'
company2.location = 'Menlo Park, CA'
company2.save

# Schools
school1 = School.new
school1.name = 'Stanford University'
school1.location = 'Palo Alto, CA'
school1.save

school2 = School.new
school2.name = 'James Logan High School'
school2.location = 'Union City, CA'
school2.save

# Research Labs
research_lab1 = ResearchLab.new
research_lab1.name = 'Batzoglou Lab'
research_lab1.school = school1
research_lab1.location = 'Stanford, CA'
research_lab1.save

research_lab2 = ResearchLab.new
research_lab2.name = 'Stanford AI Lab (SAIL)'
research_lab2.school = school1
research_lab2.location = 'Stanford, CA'
research_lab2.save

# Work Experience
work_experience1 = WorkExperience.new
work_experience1.title = 'Research Assistant'
work_experience1.start_date = Time.new(2012, 1, 1)
work_experience1.end_date = Time.now()
work_experience1.researcher = ss
work_experience1.research_lab = research_lab1
work_experience1.save

work_experience2 = WorkExperience.new
work_experience2.title = 'Research Assistant'
work_experience2.start_date = Time.new(2012, 10, 1)
work_experience2.end_date = Time.new(2013, 1, 1)
work_experience2.researcher = kg
work_experience2.research_lab = research_lab2
work_experience2.save

# Activities
activity1 = Activity.new
activity1.activity = 'Did some biocomp research on bio stuff.'
activity1.work_experience = work_experience1
activity1.save

# Education
education1 = Education.new
education1.school = school1
education1.degree = 'Bachelor of Science'
education1.major = 'Computer Science'
education1.specialization = 'Biocomputation'
education1.start_date = Time.new(2009, 9, 1)
education1.end_date = Time.now()
education1.researcher = ss
education1.save

education2 = Education.new
education2.school = school2
education2.start_date = Time.new(2006, 2, 1)
education2.end_date = Time.new(2009, 6, 1)
education2.researcher = kg
education2.save

# Courses
course1 = Course.new
course1.course_title = 'CS194'
course1.description = 'Senior project course.'
course1.education = education1
course1.save