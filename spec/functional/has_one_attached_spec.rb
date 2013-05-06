require 'spec_helper'

describe "has_one_attached" do
  before do
    @john = Person.create!(name: "John", avatar_attributes: {data: fixture('avatar.jpg')}, logo_attributes: {data: fixture('logo.jpg')})
  end
  
  it "stores the files" do
    Damselfly::File.count == 2
  end
  
  it "adds accessors to the records" do
    @john.attachments.count.should == 2
  end
  
  it "transparently handles attachments" do
    Damselfly::Attachment.first.data.should == Damselfly::File.first.file.data
  end
  
  it "load the associated files" do
    person = Person.find_by_name("John")
    person.avatar.size.should == fixture('avatar.jpg').size
    person.logo.size.should == fixture('logo.jpg').size
  end
  
  context "update" do
    before do
      @john.update_attributes(avatar_attributes: {data: fixture('another_avatar.jpg')})
    end
    
    it "replaces the file" do
      Damselfly::File.count.should == 2
    end
  end
  
  context "with the same file twice" do
    before do
      @jane = Person.create(name: "Jane", avatar_attributes: {data: fixture('avatar.jpg')})
    end
    
    it "does not allow duplicate files" do
      Damselfly::File.count.should == 2
    end
    
    it "reuses existing file" do
      @jane.avatar.file.should == @john.avatar.file
    end
    
    it "does not delete the actual file if there are still references" do
      expect{@jane.avatar.destroy}.not_to change(Damselfly::File, :count)
    end
    
    it "does delete the actual file if all references are deleted" do
      expect{@jane.avatar.destroy; @john.avatar.destroy}.to change(Damselfly::File, :count).from(2).to(1)
    end
  end
end