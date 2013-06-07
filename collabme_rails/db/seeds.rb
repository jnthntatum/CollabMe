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

ss2 = Researcher.new(:first_name => 'Syed', :last_name => 'Saleh', :email => 'shayonsaleh@yahoo.com', :password => "collabme13", :password_confirmation => "collabme13")
ss2.save()

####################

#
# Bunch of Stanford Researchers
#
aa = Researcher.new(:first_name => 'Alex', :last_name => 'Aiken', :email => 'aaiken@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
sb = Researcher.new(:first_name => 'Serafim', :last_name => 'Batzoglou', :email => 'serafim@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
gb = Researcher.new(:first_name => 'Gill', :last_name => 'Bejerano', :email => 'bejerano@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
mb = Researcher.new(:first_name => 'Michael', :last_name => 'Bernstein', :email => 'msb@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
db = Researcher.new(:first_name => 'Dan', :last_name => 'Boneh', :email => 'dabo@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
dc = Researcher.new(:first_name => 'David', :last_name => 'Cheriton', :email => 'cheriton@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
sc = Researcher.new(:first_name => 'Steve', :last_name => 'Cooper', :email => 'scooper@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
bd = Researcher.new(:first_name => 'Bill', :last_name => 'Dally', :email => 'bdally@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
dd = Researcher.new(:first_name => 'David', :last_name => 'Dill', :email => 'dill@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
de = Researcher.new(:first_name => 'Dawson', :last_name => 'Engler', :email => 'engler@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
rf = Researcher.new(:first_name => 'Ron', :last_name => 'Fedkiw', :email => 'fedkiw@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
hg = Researcher.new(:first_name => 'Hector', :last_name => 'Garcia-Molina', :email => 'hector@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
mg = Researcher.new(:first_name => 'Michael', :last_name => 'Genesereth', :email => 'mgenes@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
lg = Researcher.new(:first_name => 'Leonidas', :last_name => 'Guibas', :email => 'guibas@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
ph = Researcher.new(:first_name => 'Patrick', :last_name => 'Hanrahan', :email => 'hanrahan@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
jh = Researcher.new(:first_name => 'Jeff', :last_name => 'Heer', :email => 'jheer@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
john_hennessy= Researcher.new(:first_name => 'John', :last_name => 'Hennessy', :email => 'the_hennessy@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
mh= Researcher.new(:first_name => 'Mark', :last_name => 'Horowitz', :email => 'horowitz@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
sk = Researcher.new(:first_name => 'Sachin', :last_name => 'Katti', :email => 'skatti@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
ok = Researcher.new(:first_name => 'Oussama', :last_name => 'Khatib', :email => 'khatib@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
sk = Researcher.new(:first_name => 'Scott', :last_name => 'Klemmer', :email => 'srk@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
don_knuth = Researcher.new(:first_name => 'Don', :last_name => 'Knuth', :email => 'realmailonly@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
dk = Researcher.new(:first_name => 'Daphne', :last_name => 'Koller', :email => 'koller@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
vk = Researcher.new(:first_name => 'Vladlen', :last_name => 'Koltun', :email => 'vladlen@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
ck = Researcher.new(:first_name => 'Christos', :last_name => 'Kozyrakis', :email => 'the_hennessy@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
ml = Researcher.new(:first_name => 'Monica', :last_name => 'Lam', :email => 'lam@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
jl = Researcher.new(:first_name => 'Jure', :last_name => 'Leskovec', :email => 'jure@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
pl = Researcher.new(:first_name => 'Philip', :last_name => 'Levis', :email => 'philip.levis@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
ml = Researcher.new(:first_name => 'Marc', :last_name => 'Levoy', :email => 'levoy@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
fl = Researcher.new(:first_name => 'Fei-Fei', :last_name => 'Li', :email => 'feifeili@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
pl = Researcher.new(:first_name => 'Percy', :last_name => 'Liang', :email => 'pliang@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
cm = Researcher.new(:first_name => 'Chris', :last_name => 'Manning', :email => 'the_hennessy@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
dm = Researcher.new(:first_name => 'David', :last_name => 'Mazieres', :email => 'dm_addr@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
nm = Researcher.new(:first_name => 'Nick', :last_name => 'McKeown', :email => 'mckeown@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
tm = Researcher.new(:first_name => 'Teresa', :last_name => 'Meng', :email => 'meng@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
jm = Researcher.new(:first_name => 'John', :last_name => 'Mitchell', :email => 'jcm@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
sm = Researcher.new(:first_name => 'Subhasish', :last_name => 'Mitra', :email => 'mitra@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
an = Researcher.new(:first_name => 'Andrew', :last_name => 'Ng', :email => 'ang@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
ko = Researcher.new(:first_name => 'Kunle', :last_name => 'Olukotun', :email => 'kunle@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
jo = Researcher.new(:first_name => 'John', :last_name => 'Ousterhout', :email => 'ouster@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
sp = Researcher.new(:first_name => 'Serge', :last_name => 'Plotkin', :email => 'plotkin@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
bp = Researcher.new(:first_name => 'Balaji', :last_name => 'Prabhakar', :email => 'balaji@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
er = Researcher.new(:first_name => 'Eric', :last_name => 'Roberts', :email => 'eroberts@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
mr = Researcher.new(:first_name => 'Mendel', :last_name => 'Rosenblum', :email => 'mendel@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
tr = Researcher.new(:first_name => 'Tim', :last_name => 'Roughgarden', :email => 'the_hennessy@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
ms = Researcher.new(:first_name => 'Mehran', :last_name => 'Sahami', :email => 'sahami@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
ks = Researcher.new(:first_name => 'Ken', :last_name => 'Salisbury', :email => 'jks@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
ys = Researcher.new(:first_name => 'Yoav', :last_name => 'Shoham', :email => 'shoham@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
lt = Researcher.new(:first_name => 'Luca', :last_name => 'Trevisan', :email => 'trevisan@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
gv = Researcher.new(:first_name => 'Greg', :last_name => 'Valiant', :email => 'gvaliant@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
jw = Researcher.new(:first_name => 'Jennifer', :last_name => 'Widom', :email => 'widom@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
rw = Researcher.new(:first_name => 'Ryan', :last_name => 'Williams', :email => 'rrw@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
tw = Researcher.new(:first_name => 'Terry', :last_name => 'Winograd', :email => 'winograd@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")

#
# Researcher Schools and Education
#

bowling_green = School.new
bowling_green.name = 'Bowling Green State University'
bowling_green.location = 'Bowling Green, OH'
bowling_green.school_type = 'university'
bowling_green.save

cornell = School.new
cornell.name = 'Cornell University'
cornell.location = 'Ithaca, NY'
cornell.school_type = 'university'
cornell.save

education_aa = Education.new
education_aa.school = bowling_green
education_aa.degree = 'Bachelor of Science'
education_aa.major = 'Computer Science & Music'
education_aa.start_date = Time.new(1979, 9, 1)
education_aa.end_date = Time.new(1983, 6, 1)
education_aa.researcher = aa
education_aa.save

education_aa2 = Education.new
education_aa2.school = cornell
education_aa2.degree = 'Ph.D.'
education_aa2.major = 'Computer Science'
education_aa2.start_date = Time.new(1983, 9, 1)
education_aa2.end_date = Time.new(1988, 6, 1)
education_aa2.researcher = aa
education_aa2.save

#
# Researcher Projects
#
ddos_pj = Project.new(:name => "Defense against Distributed Denial of Service Attacks", :description => "Distributed Denial-of-Service (DDoS) attacks are an acute contemporary problem with few practical solutions available today. One key-reason why such attacks are hard to block is the large number of attack sources, which can be orders of magnitude higher than the number of filters available at the victim's firewall -- wire-speed filters are typically stored in expensive, power-hungry TCAM; today, the most sophisticated hardware router accommodates a few hundred thousand filters, while an attack can involve millions of attack sources, evenly distributed across Internet prefixes. If the victim's firewall cannot block attack traffic by itself, the straightforward solution is to push filtering of attack traffic back into the Internet core. Unfortunately, this approach does not scale, because it introduces end-to-end filtering state into core routers. Yet, there are enough filtering resources in the Internet to block large-scale attacks; they are located close to the attack sources. Active Internet Traffic Filtering (AITF) leverages this observation and enables the victim to (i) identify routers located close to the attack sources and (ii) make them block their misbehaving clients.

We use a hardware-friendly variant of Route Record to limit source address spoofing and provide the victim with a list of border routers that forward attack traffic. Upon identifying an undesired flow, the victim sends a filtering request to its gateway. The victim's gateway temporarily blocks the undesired flow and identifies the border router located closest to the attack source(s) -- call it the attack gateway. Then, the victim's gateway initiates a 'counter-connection' setup with the attack gateway, i.e., an agreement not to transmit certain packets. As soon as the counter-connection setup is completed, the victim's gateway can remove its temporary filter. If the attack gateway does not cooperate, the victim's gateway can escalate the filtering request to the next border router closest to the attack gateway. Escalation can continue recursively until a router along the attack path responds and a counter-connection setup is completed. If no router responds, attack traffic is blocked locally by the victim's gateway. However, AITF both assists and motivates routers close to the attack source(s) to help block attack traffic.

AITF enables a victim to have an undesired flow blocked within milliseconds. Also, an AITF-enabled router can block millions of flows with tens of thousands of filters and a few megabytes of DRAM -- resources easly accommodated by today's routers. Finally, AITF can be deployed incrementally and yields a concrete benefit even to the very first adopters.")
ddos_pj.owner = dc;
ddos_pj.save()

#
# Researcher Groups
#

batz_lab = Group.new(:name => "The Batzoglou Lab", :email => "serafim@estanfor.edu", :description => "We develop and apply methods for the analysis of cancer genomes. Currently we have two ongoing collaborative projects, on breast cancer and medulloblastoma.")
batz_lab.researchers << sb << ss;
batz_lab.save();

hci_group = Group.new(:name => "Stanford HCI Group", :email => "stanordHCI@estanfor.edu", :description => "CURRENT PROJECTS: Interactive Cognitive Aid; Designing an interactive cognitive aid system for crisis in the operating room; Private, Accountable Crowdsourcing Help people complete tasks; Bricolage Web design alternatives by borrowing from examples; Prototyping Theory How prototyping practices affect design work; Self & Peer Assessment Learn creative skills and wisdom.")
hci_group.researchers << mb << jh << sk << tw;
hci_group.save();

crypto_group = Group.new(:name => "Applied Crypto Group", :email => "crypto@estanfor.edu", :description => "The Applied Crypto Group is a part of the Security Lab in the Computer Science Department at Stanford University. Research projects in the group focus on various aspects of network and computer security. In particular the group focuses on applications of cryptography to real world security problems.")
crypto_group.researchers << db
crypto_group.save()

security_lab = Group.new(:name => "Stanford Security Laboratory", :email => "security@estanfor.edu", :description => "The Security Lab is a part of the Computer Science Department at Stanford University. Research projects in the group focus on various aspects of network and computer security.")
security_lab.researchers << aa << db << dd << hg << ml << dm << nm << jm << mr
security_lab.save()

#
# Researcher Info
#
gb.about_me = "Only 2-3% of the 3 billion bases in the human genome is used to encode the genome's 20-25,000 protein coding genes. Recent genomics advances have revealed a multitude of cis-regulatory regions that occupy at least 3-5 times more of the genome. These roughly 1,000,000 promoters, enhancers, silencers and insulators regulate gene expression in every cell in our body, allowing different cells to express very different protein repertoires. We study this fascinating 'control layer' of the human genome, with an aim to: identify cis-regulatory elements in the human genome and annotate them for function; map the cis-regulatory architecture controlling early limb, forebrain and placenta development, and understand its contribution to human disease; study the origins and evolution of regulatory genomic regions and reveal their contribution to vertebrate, mammalian and human specific evolution.
To address these challenges we use a potent combination of computational and experimental approaches. We write computational tools to discover cis-regulatory codes and trace their evolution; we run our tools on massive genomic datasets to generate testable hypotheses; and we perform molecular biology experiments to validate our hypotheses and generate novel ones. We work in small teams of experimentalists and computational tool users, who interact directly with our computational tool builders."

#
# Researcher Experience
#
hci_lab = ResearchLab.new
hci_lab.name = 'Stanford HCI Group'
hci_lab.location = 'Stanford, CA'
hci_lab.focus = 'Human-Computer Interaction'
hci_lab.save

work_experience_mb = WorkExperience.new
work_experience_mb.title = 'Assistant Professor, Computer Science Department'
work_experience_mb.start_date = Time.new(2013, 1, 1)
work_experience_mb.end_date = Time.now()
work_experience_mb.researcher = mb
work_experience_mb.research_lab = hci_lab
work_experience_mb.save

aa.save()
sb.save()
gb.save()
mb.save()
db.save()
dc.save()
sc.save()
bd.save()
dd.save()
de.save()
rf.save()
hg.save()
mg.save()
lg.save()
ph.save()
ok.save()
sk.save()
jh.save()
john_hennessy.save()
mh.save()
sk.save()
don_knuth.save()
dk.save()
vk.save()
ck.save()
ml.save()
jl.save()
pl.save()
ml.save()
fl.save()
jm.save()
pl.save()
tm.save()
cm.save()
nm.save()
dm.save()
sm.save()
an.save()
ko.save()
jo.save()
sp.save()
bp.save()
mr.save()
ks.save()
er.save()
ms.save()
tr.save()
ys.save()
lt.save()
gv.save()
jw.save()
rw.save()

#
# Researcher Friends
#
sb.direct_friends << gb; 

##################################

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

shayon_profile_pic = Photo.new(:file_name => 'profile_pictures/1370556442_profile.jpg')
ss.photo = shayon_profile_pic
