describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        v1 = Vote.new(value: 1)
        expect( v1.valid? ).to eq(true)
        
        v2 = Vote.new(value: -1)
        expect( v2.valid).to eq(true)
        
        invalid_v = Vote.new(value: 13)
        expect( invalid_v.valid).to eq(false)
      end
    end
  end
end