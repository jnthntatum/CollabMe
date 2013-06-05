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

# Work Experience
w1 = WorkExperience.new
w1.title = 'Research Assistant'
w1.company = 'Batzoglou Lab'
w1.location = 'Stanford University'
w1.start_date = Time.new(2012, 1, 1)
w1.end_date = Time.now()
w1.researcher = ss
w1.save

# Activities
a1 = Activity.new
a1.activity = 'Did some biocomp research on bio stuff.'
a1.work_experience = w1
a1.save