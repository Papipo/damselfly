require 'spec_helper'

describe "has_many_attached" do
  before do
    @john = Person.create!(name: "John", photos_attributes: [
      {data: fixture('avatar.jpg')},
      {data: fixture('logo.jpg')}
    ])
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
  
  it "loads the associated files" do
    person = Person.find_by_name("John")
    person.photos.find_by_filename("avatar.jpg").size.should == fixture('avatar.jpg').size
    person.photos.find_by_filename("logo.jpg").size.should == fixture('logo.jpg').size
  end
  
  context "update" do
    before do
      @john.update_attributes(photos_attributes: {id: @john.photos.first.id, data: fixture('another_avatar.jpg')})
    end
    
    it "replaces the file" do
      Damselfly::File.count.should == 2
    end
  end
  
  context "with the same file twice" do
    before do
      @jane = Person.create(name: "Jane", photos_attributes: [{data: fixture('avatar.jpg')}])
    end
    
    it "does not allow duplicate files" do
      Damselfly::File.count.should == 2
    end
    
    it "reuses existing file" do
      @jane.photos.find_by_filename("avatar.jpg").file.should == @john.photos.find_by_filename("avatar.jpg").file
    end
    
    it "does not delete the actual file if there are still references" do
      expect{@jane.photos.first.destroy}.not_to change(Damselfly::File, :count)
    end
    
    it "does delete the actual file if all references are deleted" do
      expect{@jane.photos.first.destroy; @john.photos.first.destroy}.to change(Damselfly::File, :count).from(2).to(1)
    end
  end
end