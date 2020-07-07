describe 'Keyboard', :keyPresses do
  before(:each) do
    visit '/key_presses'
  end

  it 'should send a symbol' do
    sym = %i[space tab escape control alt]
    sym.each do |s|
      find('#campo-id').send_keys s
      expect(find('#result').text).to eql "You entered: #{s.to_s.upcase}"
    end
  end

  it 'should send a letter' do
    letters = %w[a b c d e f]
    letters.each do |l|
      find('#campo-id').send_keys l
      expect(find('#result').text).to eql "You entered: #{l.to_s.upcase}"
    end
  end
end
