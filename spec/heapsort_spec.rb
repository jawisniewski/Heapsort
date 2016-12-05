require 'simplecov'
SimpleCov.start
require 'heapsort'
require 'rspec'
RSpec.describe 'heapsort.rb' do
 before(:each) do
   @unsorted = [1.22 ,3.33 ,12.55 ,5.22, 7.22,9.9, 0.12,22.23]
   @sorted =[0.12, 1.22, 3.33, 5.22, 7.22, 9.9, 12.55, 22.23]
   @unsortedWords = ["ALA" ,"MA" ,"KOTKA" ,"JOZEFA", "STAREGO","BO", "MA","KOTA"]
   @sortedWords = ["ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA", "STAREGO"]
  end
  it 'method #heapsort! work?' do
      expect{@unsorted.heapsort!}.not_to raise_error
  end


  it 'float' do
    @unsorted.heapsort!
    expect( @unsorted).to  match(@sorted)
  end
  it 'float from back ' do
    @unsorted = @sorted.reverse!

    @unsorted.heapsort!
    expect( @unsorted).to  match(@sorted)
  end
  it 'float corected table' do
    @unsorted =@sorted
    @unsorted.heapsort!
    expect(  @unsorted).to  match(@sorted)
  end
  it 'float biggest value' do
    @unsorted.heapsort!
    expect( @unsorted[7]).to eq(22.23)
  end
  it 'float lowest value' do
    @unsorted.heapsort!
    expect( @unsorted[0]).to eq(0.12)
  end
  it 'size of float' do
    @unsorted.heapsort!
    expect(@unsorted.size).to eq(8)
  end

  it 'uncorect string' do
    @unsortedWords.heapsort!
    expect(  @unsortedWords).to  match(@sortedWords)
  end
  it ' corect string' do
    @unsortedWords =@sortedWords
    @unsortedWords.heapsort!
    expect(  @unsortedWords).to  match(@sortedWords)
  end
  it ' from back string' do
    @unsortedWords=@sortedWords.reverse!
    @unsortedWords.heapsort!
    expect(  @unsortedWords).to  match(@sortedWords)
  end
   it 'file unsorted string' do
     @unsortedWords = File.read("heap.txt")
     @unsortedWords=  @unsortedWords.split( ',')
     @unsortedWords.heapsort!
     expect(   @unsortedWords).to  match( @sortedWords)
  end
  it 'file sorted string' do
    $i =0
    @unsortedWords = File.read("heap2.txt")
    @unsortedWords= @unsortedWords.split( ',')
    @unsortedWords.heapsort!
    expect(  @unsortedWords).to  match(@sortedWords)
  end
  it 'lowest value file float' do
    random_names = File.read("heapInt.txt")
    random_names= random_names.split(",").map { |s| s.to_i }
    random_names[0]=4
    random_names.heapsort!
    expect(random_names[0]).to eq(2)
  end
  it 'biggest value file float' do
    random_names = File.read("heapInt.txt")
    random_names= random_names.split(",").map { |s| s.to_i }
    random_names.heapsort!
    random_names[9]=4
    random_names.heapsort!
    expect(random_names[9]).to eq(123)
  end
  it 'empty' do
    @unsorted = []
    expect{@unsorted.heapsort!}.not_to raise_error
  end
  it 'one element' do
    @unsorted = [1]
    @unsorted.heapsort!
    expect(@unsorted).to eq([1])
  end
  it 'float and int ' do
    $i =0
    @unsorted = *@unsorted
    @unsorted.heapsort!
    expect(  @unsorted).to  match([*@sorted])
  end
  it 'float and string  = string' do
    @unsorted = [*@unsortedWords,"1" ,"3.33" ,"5.21" ,"5.22", "7","9.9", "12","22.23"]
    @unsorted.heapsort!
    expect(@unsorted).to  match(["1", "12", "22.23", "3.33", "5.21", "5.22", "7", "9.9", *@sortedWords])
  end
  it 'special keys' do
    @unsorted = ["#", "!@#", "ZA", ";", "/", "1", "!", "@"]
    @unsorted.heapsort!
    expect(@unsorted).to  match(["!", "!@#", "#", "/", "1", ";", "@", "ZA"])
  end
 it '[float] and [string]' do
    @unsorted = [@unsorted,@unsortedWords]
    @unsorted.heapsort!
    expect(@unsorted).to match ([ @sortedWords,@sorted]
)
  end
 it '[string] and float' do
    @unsortedTable =  @unsortedWords ,*@unsorted
    @unsortedTable.heapsort!
    expect(@unsortedTable).to match ([*@sorted,@sortedWords])
  end
  it 'float and [string]' do
    @unsorted = *@unsorted, @unsortedWords
    @unsorted.heapsort!
    expect(@unsorted).to match ([*@sorted,@sortedWords])
  end
  it ' string and [string]' do
    @unsorted = *@unsortedWords,@unsortedWords
    @unsorted.heapsort!
    expect(@unsorted).to match ([ *@sortedWords, @sortedWords])
  end
 it 'string and [string] [float] ' do
    @unsorted = *@unsortedWords,@unsortedWords,@unsorted
    @unsorted.heapsort!
    expect(@unsorted).to match ([*@sortedWords, @sorted,@sortedWords])
  end
 it 'float and [string] [float] ' do
    @unsorted = *@unsorted, @unsortedWords,@unsorted
    @unsorted.heapsort!
    expect(@unsorted).to match ([*@sorted, @sorted,@sortedWords])
  end
  it '[string] [float] and [float]' do
    @unsorted = @unsortedWords,@unsorted,@unsorted
    @unsorted.heapsort!
    expect(@unsorted).to match ([@sorted,@sorted,@sortedWords])
  end
  it ' [string] float and [float] ' do
    @unsorted =@unsortedWords, *@unsorted, @unsorted
    @unsorted.heapsort!
    expect(@unsorted).to match ([*@sorted, @sorted,@sortedWords])
  end
  it ' [string] [float] and float  ' do
    @unsorted =@unsortedWords, @unsorted, *@unsorted
    @unsorted.heapsort!
    expect(@unsorted).to match ([*@sorted, @sorted,@sortedWords])
  end
  it ' [string] [float] and string  ' do
    @unsorted =@unsortedWords, @unsorted, *@unsortedWords
    @unsorted.heapsort!
    expect(@unsorted).to match ([*@sortedWords, @sorted,@sortedWords])
  end
end
