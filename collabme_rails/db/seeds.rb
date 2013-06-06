# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# Researchers
ss = Researcher.new(:first_name => "Shayon", :last_name => "Saleh", :email => "ssaleh@stanford.edu", :password => "collabme13", :password_confirmation => "collabme13")
ss.password = "collabme13"
ss.about_me = "I love research collaboration!"
ss.experience = "Java, C++, Python, Rails"
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

ss2 = Researcher.new(:first_name => 'Syed', :last_name => 'Saleh', :email => 'ssaleh2@stanford.edu', :password => "collabme13", :password_confirmation => "collabme13")

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
t.assignee = ss; 
t.save();

t = Task.new(:desc => "Woo another task!!!", :category => 2);
t.project=pj;
t.category = 2; 
t.creator = ss;
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
google = Company.new
google.name = 'Google'
google.location = 'Mountain View, CA'
google.save

facebook = Company.new
facebook.name = 'Facebook'
facebook.location = 'Menlo Park, CA'
facebook.save

microsoft = Company.new
microsoft.name = 'Microsoft'
microsoft.location = 'Sunnyvale, CA'
microsoft.save

amazon = Company.new
amazon.name = 'Amazon'
amazon.location = 'Seattle, WA'
amazon.save

# Schools
stanford = School.new
stanford.name = 'Stanford University'
stanford.location = 'Palo Alto, CA'
stanford.school_type = 'university'
stanford.save

logan = School.new
logan.name = 'James Logan High School'
logan.location = 'Union City, CA'
logan.school_type = 'high school'
logan.save

# Research Labs
batzoglou_lab = ResearchLab.new
batzoglou_lab.name = 'Batzoglou Lab'
batzoglou_lab.location = 'Stanford, CA'
batzoglou_lab.focus = 'Biocomputation'
batzoglou_lab.save

sail_lab = ResearchLab.new
sail_lab.name = 'Stanford AI Lab (SAIL)'
sail_lab.location = 'Stanford, CA'
sail_lab.focus = 'Artificial Intelligence'
sail_lab.save

# Work Experience
work_experience1 = WorkExperience.new
work_experience1.title = 'Research Assistant'
work_experience1.start_date = Time.new(2012, 1, 1)
work_experience1.end_date = Time.now()
work_experience1.researcher = ss
work_experience1.research_lab = batzoglou_lab
work_experience1.save

work_experience2 = WorkExperience.new
work_experience2.title = 'Research Assistant'
work_experience2.start_date = Time.new(2012, 10, 1)
work_experience2.end_date = Time.new(2013, 1, 1)
work_experience2.researcher = kg
work_experience2.research_lab = sail_lab
work_experience2.save

work_experience3 = WorkExperience.new
work_experience3.title = 'Software Engineering Intern'
work_experience3.start_date = Time.new(2013, 6, 1)
work_experience3.end_date = Time.new(2013, 9, 1)
work_experience3.researcher = kg
work_experience3.company = microsoft
work_experience3.save

# Activities
activity1 = Activity.new
activity1.activity = 'Did some biocomputation research.'
activity1.work_experience = work_experience1
activity1.save

activity2 = Activity.new
activity2.activity = 'Going to work on Bing.'
activity2.work_experience = work_experience3
activity2.save

activity3 = Activity.new
activity3.activity = 'Worked on mlcomp, a machine learning website.'
activity3.work_experience = work_experience2
activity3.save

# Education
education1 = Education.new
education1.school = stanford
education1.degree = 'Bachelor of Science'
education1.major = 'Computer Science'
education1.specialization = 'Biocomputation'
education1.start_date = Time.new(2009, 9, 1)
education1.end_date = Time.now()
education1.researcher = ss
education1.save

education2 = Education.new
education2.school = logan
education2.start_date = Time.new(2006, 2, 1)
education2.end_date = Time.new(2009, 6, 1)
education2.researcher = kg
education2.save

education3 = Education.new
education3.school = stanford
education3.degree = 'Bachelor of Science'
education3.major = 'Computer Science'
education3.specialization = 'Artificial Intelligence'
education3.start_date = Time.new(2009, 9, 1)
education3.end_date = Time.now()
education3.researcher = kg
education3.save

# Profile Picture
kristian_profile_pic = Photo.new(:file_name => 'profile_pictures/1370497688_Me.jpg')
kg.photo = kristian_profile_pic