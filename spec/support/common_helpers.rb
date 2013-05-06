module CommonHelpers
  include ActionDispatch::TestProcess
  
  def fixture(filename)
    fixture_file_upload File.join(File.dirname(__FILE__), '..', 'fixtures', filename)
  end
end

RSpec.configure do |c|
  c.include CommonHelpers
end