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
john_hennessy = Researcher.new(:first_name => 'John', :last_name => 'Hennessy', :email => 'the_hennessy@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
mh = Researcher.new(:first_name => 'Mark', :last_name => 'Horowitz', :email => 'horowitz@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
sachin_katti = Researcher.new(:first_name => 'Sachin', :last_name => 'Katti', :email => 'skatti@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
ok = Researcher.new(:first_name => 'Oussama', :last_name => 'Khatib', :email => 'khatib@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
sk = Researcher.new(:first_name => 'Scott', :last_name => 'Klemmer', :email => 'srk@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
don_knuth = Researcher.new(:first_name => 'Don', :last_name => 'Knuth', :email => 'realmailonly@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
dk = Researcher.new(:first_name => 'Daphne', :last_name => 'Koller', :email => 'koller@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
vk = Researcher.new(:first_name => 'Vladlen', :last_name => 'Koltun', :email => 'vladlen@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
ck = Researcher.new(:first_name => 'Christos', :last_name => 'Kozyrakis', :email => 'the_hennessy@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
monica_lam = Researcher.new(:first_name => 'Monica', :last_name => 'Lam', :email => 'lam@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
jl = Researcher.new(:first_name => 'Jure', :last_name => 'Leskovec', :email => 'jure@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
philip_levis = Researcher.new(:first_name => 'Philip', :last_name => 'Levis', :email => 'philip.levis@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
ml = Researcher.new(:first_name => 'Marc', :last_name => 'Levoy', :email => 'levoy@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
fl = Researcher.new(:first_name => 'Fei-Fei', :last_name => 'Li', :email => 'feifeili@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
pl = Researcher.new(:first_name => 'Percy', :last_name => 'Liang', :email => 'pliang@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
cm = Researcher.new(:first_name => 'Chris', :last_name => 'Manning', :email => 'manning@estanfor.edu', :password => "collabme13", :password_confirmation => "collabme13")
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

syracuse = School.new
syracuse.name = 'Syracuse University'
syracuse.location = 'Syracuse, NY'
syracuse.school_type = 'university'
syracuse.save

education_sc2 = Education.new
education_sc2.school = cornell
education_sc2.degree = 'B.S.'
education_sc2.major = 'Computer Science'
education_sc2.researcher = sc
education_sc2.save

education_sc = Education.new
education_sc.school = syracuse
education_sc.degree = 'M.S.'
education_sc.major = 'Computer Science'
education_sc.researcher = sc
education_sc.save

education_sc3 = Education.new
education_sc3.school = syracuse
education_sc3.degree = 'Ph.D.'
education_sc3.major = 'Computer Science'
education_sc3.researcher = sc
education_sc3.save

ucla = School.new
ucla.name = 'University of California - Los Angeles'
ucla.location = 'Los Angeles, CA'
ucla.school_type = 'university'
ucla.save

education_rf = Education.new
education_rf.school = ucla
education_rf.degree = 'Ph.D.'
education_rf.major = 'Mathematics'
education_rf.start_date = Time.new(1990, 9, 1)
education_rf.end_date = Time.new(1996, 6, 1)
education_rf.researcher = rf
education_rf.save

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

cs_lab = Group.new(:name => "Computer Systems Laboratory", :email => "cs_lab@estanfor.edu", :description => "The Computer Systems Laboratory is a joint lab of the Departments of Electrical Engineering and Computer Science located on the Stanford University Campus in the Gates Computer Science Building.

Established in 1968, CSL has grown to include approximately 20 faculty members and 150 Ph.D. students. CSL is internationally recognized for its excellence; the faculty, research staff and students are widely known for their leadership in developing new ideas and trends in the design, organization, and use of computers. CSL is distinguished in its research and teaching.

Research in CSL is both experimental and theoretical, traversing many domains: operating systems, computer networking, special architectures, compilers, programming languages, information management, graphics, security, reliability and fault tolerance, system specification and verification, user interfaces, integrated circuit design and special computer architectures. Current research being done in the Computer Systems Laboratory can be viewed at CSL Research or Computer Forum. Technical reports are also available from 1960 to 1990 and for 2000 on.

Teaching is formalized in the classroom, but constantly challenged and enriched through the hands-on work of the various CSL project groups and the wider influence of Silicon Valley technology. Of special interest is the Stanford Electrical Engineer Computer Systems Colloquium which is open to the public. The Colloquium is an ongoing guest lecture series touching on many elements of computer systems, the technologies they employ, and the systems they enable. Outstanding and sometimes controversial speakers are drawn form academia, commercial research labs, and industry. You can review the current program on the Colloquium website and join us for the next talk! Students may enroll in the Colloquium as a class, EE380, and will earn 1 unit of S/NC credit.

Students working in CSL are admitted to either the Electrical Engineering or the Computer Science department. Usually students with primary interest in VLSI, CAD, and computer architecture come from the EE department, while students with interest in compilers, operating systems, and programming environments come from the CS department. Because of the interdisciplinary nature of the lab, there are no rigid student classifications; undergraduates, Masters students and Ph.D. candidates from either department can work with any faculty member or any research project for which they qualify. It is just this interdisciplinary composition of the research teams that has proven the CSL to be a good environment for nurturing interesting and profitable ideas.")
cs_lab.researchers << aa << db << dc << bd << dd << de << rf << hg << lg << ph << john_hennessy << mh << sk << monica_lam << pl << ml << dm << nm << tm << sm << ko << jo << bp << mr << jw << tw
cs_lab.save()

graphics_lab = Group.new(:name => "Stanford Computer Graphics Laboratory", :email => "graphics@estanfor.edu", :description => "Stanford Computer Graphics Laboratory")
graphics_lab.researchers << rf << lg << ph << jh << sk << vk << ml
graphics_lab.save()

vis_lab = Group.new(:name => "The Stanford Visualization Group", :email => "viz_group@estanfor.edu", :description => "As digital information becomes increasingly cheap and ubiquitous, how will we keep abreast with the rising tide of data? We investigate the perceptual, cognitive, and social factors involved in making sense of large data collections, and develop novel interactive systems for visual analysis and communication.")
vis_lab.researchers << ph << jh
vis_lab.save()

ai_lab = Group.new(:name => "Stanford AI Lab (SAIL)", :email => "ai_lab@estanfor.edu", :description => "The Stanford AI Lab (SAIL) is the intellectual home for researchers in the Stanford Computer Science Department whose primary research focus is Artificial Intelligence. The lab is located in the Gates Computer Science Building and the new Clark Center, where 100+ people share the space with 30+ robots.

Our mission is to change the way we understand the world. In the past decade, an abundance of data has become available, such as online data on the Web, scientific data such as the transcript of the human genome, sensor data acquired by robots or by the buildings we inhabit. The list is endless. Turning data into information pertaining to problems that people care about, is the central mission of our research. In short, we seek to develop the next generations of theory, algorithms, and systems, that help us attach meaning to bits and bytes.

Members of the Stanford AI Lab have contributed to fields as diverse as bio-informatics, cognition, computational geometry, computer vision, decision theory, distributed systems, game theory, image processing, information retrieval, knowledge systems, logic, machine learning, multi-agent systems, natural language, neural networks, planning, probabilistic inference, sensor networks, and robotics. We invite you to browse our Web site to find out more about our research. Share our excitement about AI, and the many ways in which computers are changing almost every aspect of our lives.")
ai_lab.researchers << sb << gb << mg << lg << ok << dk << fl << pl << jl << cm << an << ks << ys
ai_lab.save()

mobisocial_lab = Group.new(:name => "The Stanford Mobile and Social Computing Research Group (MobiSocial)", :email => "mobisocial@estanfor.edu", :description => "What does the future hold when we have billions of users with personal smart phones? Like the PCs automating the office, smart phones will transform our social life. The Stanford MobiSocial Computing Laboratory focuses on creating novel user experience, system architecture, infrastructure design, development frameworks, and security protocols for the programmable open mobile internet (POMI) by year 2020.")
mobisocial_lab.researchers << monica_lam << db << sk << jl << nm
mobisocial_lab.save()

sing = Group.new(:name => "Stanford Information Networks Group (SING)", :email => "sing@estanfor.edu", :description => "The Stanford Information Networks Group (SING) researches data-centric networked systems. Currently, much of its work deals with low-power sensor networks, including measuring the behavior of low-power wireless, network protocols and architecture, and operating systems. It also includes work in network infrastructures for virtual worlds.")
sing.researchers << philip_levis
sing.save()

nlp_group = Group.new(:name => "The Stanford Natural Language Processing Group", :email => "nlp_group@estanfor.edu", :description => "NLP")
nlp_group.researchers << pl << cm
nlp_group.save()

pp_group = Group.new(:name => "Pervasive Parallelism Laboratory", :email => "pp_group@estanfor.edu", :description => "The Stanford Pervasive Parallelism Lab is a collaboration of many leading Stanford computer scientists and electrical engineers for the purpose of developing the parallel computing platform for the year 2020. We are supported by a completely open industrial affiliates program.")
pp_group.researchers << ko << bd << john_hennessy << mh << aa << ph << mr << jo << rf << vk
pp_group.save()

#
# Researcher Info
#
gb.about_me = "Only 2-3% of the 3 billion bases in the human genome is used to encode the genome's 20-25,000 protein coding genes. Recent genomics advances have revealed a multitude of cis-regulatory regions that occupy at least 3-5 times more of the genome. These roughly 1,000,000 promoters, enhancers, silencers and insulators regulate gene expression in every cell in our body, allowing different cells to express very different protein repertoires. We study this fascinating 'control layer' of the human genome, with an aim to: identify cis-regulatory elements in the human genome and annotate them for function; map the cis-regulatory architecture controlling early limb, forebrain and placenta development, and understand its contribution to human disease; study the origins and evolution of regulatory genomic regions and reveal their contribution to vertebrate, mammalian and human specific evolution.
To address these challenges we use a potent combination of computational and experimental approaches. We write computational tools to discover cis-regulatory codes and trace their evolution; we run our tools on massive genomic datasets to generate testable hypotheses; and we perform molecular biology experiments to validate our hypotheses and generate novel ones. We work in small teams of experimentalists and computational tool users, who interact directly with our computational tool builders."

lg.about_me = "Professor Guibas heads the Geometric Computation group in the Computer Science Department of Stanford University and is a member of the Computer Graphics and Artificial Intelligence Laboratories. He works on algorithms for sensing, modeling, reasoning, rendering, and acting on the physical world. Professor Guibas' interests span computational geometry, geometric modeling, computer graphics, computer vision, sensor networks, robotics, and discrete algorithms --- all areas in which he has published and lectured extensively."

sk.about_me = "Scott is an Associate Professor of Computer Science at Stanford University. He co-directs the Human-Computer Interaction Group and holds the Bredt Faculty Scholar development chair. Organizations around the world use his lab's open-source design tools and curricula; several books and popular press articles have covered his research and teaching. He has been awarded the Katayanagi Emerging Leadership Prize, Sloan Fellowship, NSF CAREER award, Microsoft Research New Faculty Fellowship. He has authored and co-authored more than 40 peer-reviewed articles; eight were awarded best paper or honorable mention at the premier HCI conferences. His former graduate students are leading professors, researchers, founders, social entrepeneurs, and engineers. He has a dual BA in Art-Semiotics and Computer Science from Brown University, Graphic Design work at RISD, and an MS and PhD in Computer Science from UC Berkeley."

dk.about_me = "I am the Rajeev Motwani Professor in the Computer Science Department at Stanford University. I joined the department in September 1995.   I also have a courtesy appointment in the Department of Pathology.

I completed my PhD in 1993 at Stanford, and was a postdoctoral researcher at the Computer Science Division at UC Berkeley.  Before that, I did my masters and undergraduate degrees at the Hebrew University of Jerusalem, Israel."

vk.about_me = "I am an assistant professor of Computer Science at Stanford, specializing in visual computing."

jl.about_me = "I am assistant professor of Computer Science at Stanford University. My research focuses on mining and modeling large social and information networks, their evolution, and diffusion of information and influence over them. Problems I investigate are motivated by large scale data, the Web and on-line media."

philip_levis.about_me = "I'm an Associate Professor in the Computer Science and Electrical Engineering Departments of Stanford University, where I head the Stanford Information Networking Group (SING). I research operating systems, network protocols, hardware and software design for computers that touch the physical world, such as embedded systems, sensor networks, mobile phones, green computing, wireless networks, 3D virtual worlds, and physical simulation.
The operating systems, languages and tools I've researched are used by thousands of people, run on hundreds of thousands of devices, and are the basis for the Internet standard for connecting physical objects, such electricity meters, to the Internet (which I co-authored). I've authored over 60 peer reviewed papers, several of which have received best paper or most influential paper awards. I've been awarded an NSF CAREER Award, a Microsoft New Faculty Fellowship, and a Stanford Terman Fellowship. I co-founded Kumu Networks to commercialize research from SING on full duplex wireless."

ml.about_me = "Marc Levoy is the VMware Founders Professor of Computer Science at Stanford University, with a joint appointment in the Department of Electrical Engineering. He received a Bachelor's and Master's in Architecture from Cornell University in 1976 and 1978, and a PhD in Computer Science from the University of North Carolina at Chapel Hill in 1989. In the 1970's Levoy worked on computer animation, developing a cartoon animation system that was used by Hanna-Barbera Productions to make The Flintstones, Scooby Doo, and other shows. In the 1980's Levoy worked on volume rendering, a technique for displaying three-dimensional functions such as computed tomography (CT) or magnetic resonance (MR) data. In the 1990's he worked on 3D laser scanning, culminating in the Digital Michelangelo Project, in which he and his students spent a year in Italy digitizing the statues of Michelangelo. Outside of academia, Levoy co-designed the Google book scanner and launched Google's Street View project. His current interests include light fields. optical microscopy, and computational photography - meaning computational imaging techniques that extend the capabilities of digital photography. Awards: Charles Goodwin Sands Medal for best undergraduate thesis (1976), National Science Foundation Presidential Young Investigator (1991), ACM SIGGRAPH Computer Graphics Achievement Award (1996), ACM Fellow (2007)."

fl.about_me = "Research in our lab focuses on two intimately connected branches of vision research: computer vision and human vision. In both fields, we are intrigued by visual functionalities that give rise to semantically meaningful interpretations of the visual world. In computer vision, we aspire to build intelligent visual algorithms that perform important visual perception tasks such as object recognition, scene categorization, integrative scene understanding, human motion recognition, material recognition, etc. In human vision, our curiosity leads us to study the underlying neural mechanisms that enable the human visual system to perform high level visual tasks with amazing speed and efficiency."

cm.about_me = "Chris Manning works on systems and formalisms that can intelligently process and produce human languages. His research concentrates on probabilistic models of language and statistical natural language processing; including text understanding, text mining, machine translation, information extraction, named entity recognition, part-of-speech tagging, probabilistic parsing and semantic role labeling, syntactic typology, computational lexicography, and other topics in computational linguistics and machine learning."

dm.about_me = "David Mazieres is an associate professor of Computer Science at Stanford University, where he leads the Secure Computer Systems research group.  Prof. Mazieres received a BS in Computer Science from Harvard in 1994 and Ph.D. in Electrical Engineering and Computer Science from MIT in 2000.  Prof. Mazieres's research interests include Operating Systems and Distributed Systems, with a particular focus on security.  Some of the projects he and his students have worked on include SFS (a self-certifying network file system), SUNDR (a file system that introduced the notion of fork linearizability), Kademlia (a widely used peer-to-peer routing algorithm), Coral (a peer-to-peer content distribution network), HiStar (a secure operating system based on decentralized information flow control), and ICING (a network architecture allowing enforcement of decentralized policies).  Most recently, Prof. Mazieres is working on language-level security in Haskell and on a new web security architecture called Starlight based on information flow control.  Prof. Mazieres has several awards including a Sloan award (2002), USENIX best paper award (2001), NSF CAREER award (2001), MIT Sprowls best thesis in computer science award (2000), and fast-track journal papers at OSDI (2000), SOSP (1995), and SOSP (2005)."

nm.about_me = "Nick McKeown is the Kleiner Perkins, Mayfield and Sequoia Professor of Electrical Engineering and Computer Science at Stanford University, and Faculty Director of the Open Networking Research Center. From 1986-1989 he worked for Hewlett-Packard Labs in Bristol, England. In 1995, he helped architect Cisco's GSR 12000 router. In 1997 Nick co-founded Abrizio Inc. (acquired by PMC-Sierra), where he was CTO. He was co-founder and CEO of Nemo ('Network Memory'), which is now part of Cisco. In 2007 he co-founded Nicira (acquired by VMware) with Martin Casado and Scott Shenker. In 2011, he co-founded the Open Networking Foundation (ONF) with Scott Shenker.

Nick is a member of the US National Academy of Engineering (NAE), a Fellow of the Royal Academy of Engineering (UK), Fellow of the IEEE and the ACM. In 2005, he was awarded the British Computer Society Lovelace Medal, in 2009 the IEEE Kobayashi Computer and Communications Award and in 2012 the ACM Sigcomm Lifetime Achievement Award. Nick is the STMicroelectronics Faculty Scholar, the Robert Noyce Faculty Fellow, a Fellow of the Powell Foundation and the Alfred P. Sloan Foundation, and recipient of a CAREER award from the National Science Foundation. In 2000, he received the IEEE Rice Award for the best paper in communications theory. Nick's current research interests include software defined networks (SDN), how to enable more rapid improvements to the Internet infrastructure, and tools and platforms for networking research and teaching."

tm.about_me = "Teresa H. Meng is the Reid Weaver Dennis Professor of Electrical Engineering at Stanford University. Her research activities during the first 10 years at Stanford focused on low-power circuit and system design, video signal processing, and wireless communications. In 1999, Dr. Meng took leave from Stanford and founded Atheros Communications, Inc., which developed semiconductor system solutions for communication network products. She returned to Stanford in 2000 to continue her research and teaching at the University.
Dr. Meng has received many awards and honors, including the Distinguished Alumni Award from the U.C. Berkeley EECS Department and the Nationnal Taiwan University in 2010, the 2009 IEEE Solid-State Circuits Field Award, the DEMO Lifetime Achievement Award in 2009, the McKnight Technological Innovations in Neurosciences Award in 2007, the Distinguished Lecturer Award from the IEEE Signal Processing Society in 2004, the Bosch Faculty Scholar Award in 2003, the Innovator of the Year Award by MIT Sloan School eBA in 2002, the CIO 20/20 Vision Award in 2002, named one of the Top 10 Entrepreneurs by Red Herring in 2001, a Best Paper Award from the IEEE Signal Processing Society, an NSF Presidential Young Investigator Award, an ONR Young Investigator Award, and an IBM Faculty Development Award, all in 1989, and the Eli Jury Award from U.C. Berkeley in 1988.

Dr. Meng's current research interests are bio-implant technologies, neural signal processing and non-invasive medical treatments using focused EM energy. She has given plenary talks at major conferences in the areas of signal processing and wireless communications. She is the author of one book, several book chapters, and over 200 technical articles in journals and conferences. Dr. Meng is a Fellow of the IEEE and a member of the National Academy of Engineering. She is also a member of the Academia Sinica of Taiwan. She received her M.S. and Ph.D. in EECS from the University of California at Berkeley and her B.S. from National Taiwan University."

sm.about_me = "Professor Subhasish Mitra directs the Robust Systems Group in the Department of Electrical Engineering and the Department of Computer Science of Stanford University, where he is the Chambers Faculty Scholar of Engineering. Prior to joining Stanford, he was a Principal Engineer at Intel Corporation. He received Ph.D. in Electrical Engineering from Stanford University.
 
Prof. Mitra's research interests include robust system design, VLSI design, CAD, validation and test, and emerging nanotechnologies.  His X-Compact technique for test compression has been used in more than 50 Intel products, and has influenced major Electronic Design Automation tools.  The IFRA technology for post-silicon validation, created jointly with his student, was characterized as 'a breakthrough' in a Research Highlight in the Communications of the ACM (CACM). His work on the first demonstration of carbon nanotube imperfection-immune digital VLSI, jointly with his students and collaborators, was selected by the National Science Foundation (NSF) as a Research Highlight to the United States Congress, and was highlighted 'as a significant breakthrough' by the Semiconductor Research Corporation (SRC), the MIT Technology Review, the New York Times, and several others.

Prof. Mitra has served on numerous conference committees and journal editorial boards. Recently, he served on the Defense Advanced Research Projects Agency's (DARPA) Information Science and Technology (ISAT) Board as an invited member. He is a Fellow of the IEEE."

jo.about_me = "I received a BS in Physics from Yale University in 1975 and a PhD in Computer Science from Carnegie Mellon University in 1980.

From 1980-1994 I was a Professor of Computer Science at the University of California, Berkeley. My research projects included design tools for integrated circuits such as the Magic layout editor and the Crystal timing analyzer, the Sprite network operating system, log-structured file systems, the Tcl scripting language, and the Tk toolkit.

In 1994 I left Berkeley to fulfill a long-standing desire to build commercial software. From 1994-1998 I was a Distinguished Engineer at Sun Microsystems Laboratories. In 1998 I founded Scriptics Corporation to commercialize Tcl development tools, where I was CEO until 2000. In 2002 I founded Electric Cloud. I was at Electric Cloud until 2007, and I led the development of a parallel build system (ElectricAccelerator) and a Web-based server for managing distributed processes such as nightly builds and automated tests (ElectricCommander).

In 2008 I returned to academia as Professor (Research) in the Department of Computer Science at Stanford."

sp.about_me = "Serge Plotkin is an Associate Professor of Computer Science at Stanford University. Serge has served as a Vice Chair of IEEE  Security in Storage Workgroup (P1619/P1619.1/P1619.2 workgroups) since its inception in 2003  and is the technical editor of the IEEE1619 standard. Serge is also a venture partner at Opus Capital, a venture capital fund that focuses on investments in early-stage technology companies. In 2001 Serge co-founded Decru and served as CTO and VP Engineering. Decru became the leader in the emerging field of security for data-at-rest and was acquired by Network Appliance in 2005."

bp.about_me = "Balaji Prabhakar is a faculty member in the Departments of Electrical Engineering and Computer Science at Stanford University. His research interests are in computer networks; notably, in designing algorithms for the Internet and for Data Centers. Recently, he has been interested in Societal Networks: networks vital for society's functioning, such as transportation, electricity and recycling systems. He has been involved in developing and deploying incentive mechanisms to move commuters to off-peak times so that congestion, fuel and pollution costs are reduced.

He has been a Terman Fellow at Stanford University and a Fellow of the Alfred P. Sloan Foundation. He has received the CAREER award from the U.S. National Science Foundation, the Erlang Prize, the Rollo Davidson Prize, and delivered the Lunteren Lectures. He is a co-recipient of several best paper awards."


#
# Researcher Experience
#
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

stanford_cs = Company.new
stanford_cs.name = 'Stanford Computer Science Department'
stanford_cs.location = 'Stanford, CA'
stanford_cs.save


stanford_ee = Company.new
stanford_ee.name = 'Stanford Electrical Engineering Department'
stanford_ee.location = 'Stanford, CA'
stanford_ee.save

work_experience_dd = WorkExperience.new
work_experience_dd.title = 'Professor of Computer Science'
work_experience_dd.start_date = Time.new(1987, 1, 1)
work_experience_dd.end_date = Time.now()
work_experience_dd.researcher = dd
work_experience_dd.company = stanford_cs
work_experience_dd.save

work_experience_mg = WorkExperience.new
work_experience_mg.title = 'Associate Professor of Computer Science'
work_experience_mg.end_date = Time.now()
work_experience_mg.researcher = mg
work_experience_mg.company = stanford_cs
work_experience_mg.save

work_experience_mh = WorkExperience.new
work_experience_mh.title = 'Chairman'
work_experience_mh.start_date = Time.new(1984, 1, 1)
work_experience_mh.end_date = Time.now()
work_experience_mh.researcher = mh
work_experience_mh.company = stanford_ee
work_experience_mh.save

work_experience_sachin_katti = WorkExperience.new
work_experience_sachin_katti.title = 'Associate Professor'
work_experience_sachin_katti.start_date = Time.new(2010, 1, 1)
work_experience_sachin_katti.end_date = Time.now()
work_experience_sachin_katti.researcher = sachin_katti
work_experience_sachin_katti.company = stanford_ee
work_experience_sachin_katti.save

work_experience_sachin_katti2 = WorkExperience.new
work_experience_sachin_katti2.title = 'Associate Professor'
work_experience_sachin_katti2.start_date = Time.new(2010, 1, 1)
work_experience_sachin_katti2.end_date = Time.now()
work_experience_sachin_katti2.researcher = sachin_katti
work_experience_sachin_katti2.company = stanford_cs
work_experience_sachin_katti2.save

work_experience_jl = WorkExperience.new
work_experience_jl.title = 'Assistant Professor'
work_experience_jl.start_date = Time.new(2009, 9, 1)
work_experience_jl.end_date = Time.now()
work_experience_jl.researcher = jl
work_experience_jl.company = stanford_cs
work_experience_jl.save

work_experience_an = WorkExperience.new
work_experience_an.title = 'Director'
work_experience_an.start_date = Time.new(1995, 1, 1)
work_experience_an.end_date = Time.now()
work_experience_an.researcher = an
work_experience_an.research_lab = sail_lab
work_experience_an.save

work_experience_an2 = WorkExperience.new
work_experience_an2.title = 'Associate Professor'
work_experience_an2.start_date = Time.new(1995, 1, 1)
work_experience_an2.end_date = Time.now()
work_experience_an2.researcher = an
work_experience_an2.company = stanford_cs
work_experience_an2.save

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
sachin_katti.save()
jh.save()
john_hennessy.save()
mh.save()
sk.save()
don_knuth.save()
dk.save()
vk.save()
ck.save()
monica_lam.save()
jl.save()
philip_levis.save()
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

#
# Researcher Profile Pics
#
de_profile_pic = Photo.new(:file_name => 'profile_pictures/1370573979_d_engler_profile.jpg')
de.photo = de_profile_pic

hg_profile_pic = Photo.new(:file_name => 'profile_pictures/1370574737_hector.jpg')
hg.photo = hg_profile_pic

don_knuth_profile_pic = Photo.new(:file_name => 'profile_pictures/1370577885_knuth.gif')
don_knuth.photo = don_knuth_profile_pic

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
