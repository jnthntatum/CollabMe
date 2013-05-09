class LoadData < ActiveRecord::Migration
  def up
    down

    # Create initial researchers
    ss = Researcher.new(:firstname => "Shayon", :lastname => "Saleh", :email => "ssaleh@stanford.edu")
    ss.save(:validate => false)
    kg = Researcher.new(:firstname => "Kristian", :lastname => "Gampong", :email => "kgampong@stanford.edu")
    kg.save(:validate => false)
    gk = Researcher.new(:firstname => "Gavin", :lastname => "Kho", :email => "gdykho@stanford.edu")
    gk.save(:validate => false)
    jt = Researcher.new(:firstname => "Jonathan", :lastname => "Tatum", :email => "jdtatum@stanford.edu")
    jt.save(:validate => false)
  end

  def down
    Group.delete_all
    Project.delete_all
    Researcher.delete_all
    Resource.delete_all
    Task.delete_all
  end
end
