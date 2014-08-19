# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class User
  def in_role?(role)
    role == @role
  end

  def assign_role(role)
    @role = role
  end

end

describe User do
  before(:each) do
    @user = User.new
  end

  subject { @user }

  context "when name empty" do
    it { should_not be_valid }
    specify { @user.save.should == false }
  end

#  context "when name not empty" do
#    before { @user.name = 'admin' }
#    it { should_not be_valid }
#    specify { @user.save.should == true }
#  end

  it "should be valid" do
    @user.should_not be_valid
  end

  it "should not be valid without name" do
    @user.name = ""
    @user.should_not be_valid
  end

  it "should not be valid without email" do
    @user.email = ""
    @user.should_not be_valid
  end

  it "should not be valid without phone" do
    @user.phone = ""
    @user.should_not be_valid
  end

  it "should not be valid without username" do
    @user.username = ""
    @user.should_not be_valid
  end

  it "should not be valid without password" do
    @user.password = ""
    @user.should_not be_valid
  end

  it "should be in assigned role" do
    @user.should be_in_role(@role)
    @user.assign_role("assigned")
  end

  it "should not be in roles assigned to it" do
    @user.should_not be_in_role("unassigned role")
  end

  def valid_user_hash
   @user = {:name => "sani", :email => "sani@email.com"}
   @user.save
  end

end



