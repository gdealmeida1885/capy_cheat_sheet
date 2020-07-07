describe 'file upload', :upload do
  before :each do
    @arquivo = Dir.pwd + '/spec/fixtures/'

    visit '/upload'
  end

  it 'should upload a txt', :uploadTxt do
    attach_file('file-upload', @arquivo + 'arquivo.txt')
    click_button 'Upload'
    expect(find('#uploaded-file').text).to eql 'arquivo.txt'
  end

  it 'should upload an image', :uploadImg do 
    attach_file('file-upload', @arquivo + 'geraldo.png')
    click_button 'Upload'
    expect(find('#new-image')[:src]).to include 'geraldo.png'
  end
end
