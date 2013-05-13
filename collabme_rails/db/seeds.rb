# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 	ss = Researcher.new(:first_name => "Shayon", :last_name => "Saleh", :email => "ssaleh@stanford.edu")
 	ss.save(:validate => false)
	kg = Researcher.new(:first_name => "Kristian", :last_name => "Gampong", :email => "kgampong@stanford.edu")
    kg.save(:validate => false)
    gk = Researcher.new(:first_name => "Gavin", :last_name => "Kho", :email => "gdykho@stanford.edu")
    gk.save(:validate => false)
    jt = Researcher.new(:first_name => "Jonathan", :last_name => "Tatum", :email => "jdtatum@stanford.edu")
    jt.save(:validate => false)

    rr = Researcher.new(:first_name => "Radom", :last_name => "McRandomson", :email => "rr@dsl.com")
    
    pj = Project.new(:name => "CollabMe", :description => "GroupProject Page! Woo and hoo.")
    pj.owner = gk; 
    pj.members << ss << kg << jt;
    pj.save();
    
    ss.direct_friends << kg << gk << jt;
    kg.direct_friends << gk << jt; 
    gk.direct_friends << jt; 

    t = Task.new(:desc => "Woo a task!!!", :category => 1);
    t.project=pj;
    t.category = 1; 
    t.creator = jt; 
    t.save();

    p = Post.new(:title=>"comment", :desc => "What an awesome project!!!")
    pj.posts << p;    