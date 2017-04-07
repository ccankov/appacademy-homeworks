require 'rspec'
require 'lru_cache'

describe LRUCache do
  subject(:lru) { LRUCache.new(4) }

  describe '#initialize' do
    it 'creates a private Array to store items in cache' do
      expect(lru.show).to be_empty
    end
    it 'does not allow direct access to the cache Array' do
      expect { lru.cache }.to raise_error(NoMethodError)
    end
  end

  describe '#count' do
    it 'returns 0 for new LRUCaches' do
      expect(lru.count).to eq(0)
    end
    it 'returns proper count for caches with objects in them' do
      lru.add(1)
      expect(lru.count).to eq(1)
      lru.add(2)
      lru.add(3)
      expect(lru.count).to eq(3)
    end
  end

  describe '#add(el)' do
    it 'adds new objects to the LRUCache' do
      hash = { foo: 'bar' }
      lru.add(hash)
      expect(lru.show).to include(hash)
    end
    it 'does not allow the cache to exceed its preallocated size' do
      (1..8).each { |num| lru.add(num) }
      expect(lru.count).to eq(4)
    end
    it 'removes items in FIFO order' do
      (1..8).each { |num| lru.add(num) }
      (1..4).each do |missing_num|
        expect(lru.show).to_not include(missing_num)
      end
      (5..8).each do |present_num|
        expect(lru.show).to include(present_num)
      end
    end
    it 'does not add duplicates' do
      4.times { lru.add(4) }
      expect(lru.count).to eq(1)
    end
  end

  describe '#show' do
    it 'correctly displays the contents of the cache' do
      (1..4).each { |num| lru.add(num) }
      lru.add('banana')
      expect(lru.show).to eq([2, 3, 4, 'banana'])
    end
    it 'passes the AppAcademy spec' do
      lru.add('I walk the line')
      lru.add(5)
      expect(lru.count).to eq(2)
      lru.add([1, 2, 3])
      lru.add(5)
      lru.add(-5)
      lru.add({a: 1, b: 2, c: 3})
      lru.add([1, 2, 3, 4])
      lru.add('I walk the line')
      lru.add(:ring_of_fire)
      lru.add('I walk the line')
      lru.add({a: 1, b: 2, c: 3})
      expect(lru.show).to eq([[1, 2, 3, 4], :ring_of_fire, 'I walk the line', {:a=>1, :b=>2, :c=>3}])
    end
  end
end
