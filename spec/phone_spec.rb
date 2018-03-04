
describe Phone do

  subject { Phone.new }
  
  it 'it show its version' do
    expect(subject.version).not_to eql(nil)
  end
  
  context "Test with a valid number" do 

    let(:number)  { '+50250191704' }
    let(:result)  { subject.validate(number) }

    it "It is a hash" do
      expect(result).to be_a(Hash)
    end

    it "It is a valid number" do
      expect(result[:ok]).to eql(true)
    end

    it "Valid extra parameters" do
      expect(result[:country]).to                 eql('GT')
      expect(result[:country_code]).to            eql('502')
      expect(result[:human_type]).to              eql('Mobile')
      expect(result[:national]).to                eql('5019 1704')
      expect(result[:phonelib_version].empty?).to eql(false)
    end
  end

  context "Test with a invalid number" do 

    let(:number)  {'+5025019170'}
    let(:result)  { subject.validate(number)}

    it "It is a hash" do
      expect(result).to be_a(Hash)
    end

    it "It is not a valid number" do
      expect(result[:ok]).not_to eql(true)
    end

    it "Invalid extra parameters" do
      expect(result[:country]).to                 eql('')
      expect(result[:country_code]).to            eql('')
      expect(result[:human_type]).to              eql('')
      expect(result[:national]).to                eql('5025019170')
      expect(result[:phonelib_version].empty?).to eql(false)
    end
  end  

  context "Test with empty" do 

    let(:number)  {''}
    let(:result)  { subject.validate(number)}

    it "It is a hash" do
      expect(result).to be_a(Hash)
    end

    it "It is not a valid number" do
      expect(result[:ok]).not_to eql(true)
    end
    
    it "Invalid extra parameters" do
      expect(result[:country]).to                 eql('')
      expect(result[:country_code]).to            eql('')
      expect(result[:human_type]).to              eql('')
      expect(result[:phonelib_version].empty?).to eql(false)
    end
  end  

end