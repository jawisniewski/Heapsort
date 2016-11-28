require 'simplecov'
SimpleCov.start
require 'heapsort'
require 'rspec'
RSpec.describe 'heapsort.rb' do
 before(:each) do
    @unsorted = [1.22 ,3.33 ,5.21 ,5.22, 7.22,9.9, 0.12,22.23]
	@sorted =[0.12, 1.22, 3.33, 5.21, 5.22, 7.22, 9.9, 22.23]
   @unsortedWords = ["ALA" ,"MA" ,"KOTKA" ,"JOZEFA", "STAREGO","BO", "MA","KOTA"]
@sortedWords = ["ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA", "STAREGO"]
  end
  it 'method #heapsort! work?' do
    
    expect{@unsorted.heapsort!}.not_to raise_error
  end
   
it ' float?' do
    $i =0
   while $i<@unsorted.length do
      expect(@unsorted[$i]).to be_a_kind_of Float
      $i+=1
    end
  
  end
  it 'float' do
    @unsorted.heapsort!
    expect( @unsorted).to  match(@sorted)

  end
it 'float from back ' do

      
    @unsorted = [22.23,9.9,7.22, 5.22,5.21, 3.33,1.22, 0.12]
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
  it 'table of string?' do
    $i =0
  
    while $i<@unsortedWords.length do
      expect(@unsortedWords[$i]).to be_a_kind_of String
      $i+=1
    end
  

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
 @unsortedWords=["STAREGO","MA","MA","KOTA","KOTKA","JOZEFA","BO","ALA"]
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

  it 'Sprawdzenie najmiejszej wartosci z pliku' do
    random_names = File.read("heapInt.txt")
    random_names= random_names.split(",").map { |s| s.to_i }
    random_names[0]=4
    random_names.heapsort!
    expect(random_names[0]).to eq(2)
  end
  it 'Sprawdzenie najwiekszej wartosci z pliku' do
    random_names = File.read("heapInt.txt")
    random_names= random_names.split(",").map { |s| s.to_i }
    random_names.heapsort!
    expect(random_names[9]).to eq(1111)
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
     @unsorted = [1 ,3.33 ,5.21 ,5.22, 7,9.9, 12,22.23]

    @unsorted.heapsort!
    expect(  @unsorted).to  match([1, 3.33, 5.21, 5.22, 7, 9.9, 12, 22.23])

  end
  it 'float and string  = string' do
   
    @unsorted = ["ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA", "STAREGO","1" ,"3.33" ,"5.21" ,"5.22", "7","9.9", "12","22.23"]

    @unsorted.heapsort!
    expect(@unsorted).to  match(["1", "12", "22.23", "3.33", "5.21", "5.22", "7", "9.9", "ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA", "STAREGO"])

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
    @unsortedTable =  @unsortedWords ,1.22 ,3.33 ,5.21 ,5.22, 7.22,9.9, 0.12,22.23
@unsortedTable.heapsort!
   expect(@unsortedTable).to match ([0.12, 1.22, 3.33, 5.21, 5.22, 7.22, 9.9, 22.23,@sortedWords])

  end
it 'float and [string]' do
@unsorted = 1.22,3.33 ,5.21 ,5.22, 7.22,9.9, 0.12, 22.23, @unsortedWords
@unsorted.heapsort!
   expect(@unsorted).to match ([0.12, 1.22, 3.33, 5.21, 5.22, 7.22, 9.9, 22.23,@sortedWords])

  end
 it ' string and [string]' do
    @unsorted = "ALA" ,"MA" ,"KOTKA" ,"JOZEFA", "STAREGO","BO", "MA","KOTA",@unsortedWords 
@unsorted.heapsort!
   expect(@unsorted).to match ([ "ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA", "STAREGO", @sortedWords])

  end

 it 'string and [string] [float] ' do
    @unsorted =  "ALA" ,"MA" ,"KOTKA" ,"JOZEFA", "STAREGO","BO", "MA","KOTA",@unsortedWords,@unsorted
@unsorted.heapsort!
   expect(@unsorted).to match (["ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA", "STAREGO", @sorted,@sortedWords])

  end
 
 it 'float and [string] [float] ' do
    @unsorted = 1.22,3.33 ,5.21 ,5.22, 7.22,9.9, 0.12, 22.23, @unsortedWords,@unsorted
@unsorted.heapsort!
   expect(@unsorted).to match ([0.12, 1.22, 3.33, 5.21, 5.22, 7.22, 9.9, 22.23, @sorted,@sortedWords])

  end
 it '[string] [float] and [float]' do
    @unsorted = @unsortedWords,@unsorted,@unsorted
@unsorted.heapsort!
   expect(@unsorted).to match ([@sorted,@sorted,@sortedWords])

  end
 it ' [string] float and [float] ' do
    @unsorted =@unsortedWords, 1.22,3.33 ,5.21 ,5.22, 7.22,9.9, 0.12, 22.23, @unsorted
@unsorted.heapsort!
   expect(@unsorted).to match ([0.12, 1.22, 3.33, 5.21, 5.22, 7.22, 9.9, 22.23, @sorted,@sortedWords])

  end
it ' [string] [float] and float  ' do
    @unsorted =@unsortedWords, @unsorted, 1.22,3.33 ,5.21 ,5.22, 7.22,9.9, 0.12, 22.23
@unsorted.heapsort!
   expect(@unsorted).to match ([0.12, 1.22, 3.33, 5.21, 5.22, 7.22, 9.9, 22.23, @sorted,@sortedWords])

  end
it ' [string] [float] and string  ' do
    @unsorted =@unsortedWords, @unsorted, "ALA" ,"MA" ,"KOTKA" ,"JOZEFA", "STAREGO","BO", "MA","KOTA"
@unsorted.heapsort!
   expect(@unsorted).to match (["ALA", "BO", "JOZEFA", "KOTA", "KOTKA", "MA", "MA", "STAREGO", @sorted,@sortedWords])

  end
end
