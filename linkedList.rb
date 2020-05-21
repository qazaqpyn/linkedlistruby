class LinkedList
    attr_accessor :size, :head, :tail

    def initialize
        @size = 0
        @head = nil
        @tail = nil
    end

    def append(value)
        @size += 1
        node = Node.new(value)
        if @head == nil 
            @head = node
        else
            @tail.next_node = node
        end
        @tail = node
        
    end

    def prepend(value)
        @size += 1
        node = Node.new(value,@head)
        @head = node
    end

    def size
        @size
    end

    def head
        @head.value
    end

    def tail
        @tail.value
    end

    def at(index)
        current = @head
        x = index - 1
        x.times do 
            current = current.next_node
        end
        return current.value
    end

    def pop
        x = @size - 2
        current = @head
        x.times do 
            current = current.next_node
        end
        current.next_node = nil
        @tail = current
        @size -= 1
    end

    def contains?(value)
        x = @size 
        current = @head
        x.times do 
            if current.value == value
                return true
            end
            current = current.next_node
        end
        return false
    end

    def find(value)
        index = 0 
        x = @size 
        current = @head
        x.times do 
            index += 1
            if current.value == value
                return index
            end
            current = current.next_node
        end
        return nil
    end

    def to_s
        x = @size 
        current = @head
        x.times do  
            print "(#{current.value}) -> "
            current = current.next_node
        end
        print "nil\n"
    end

    def insert_at(value, index)
        if index > @size
            return false
        end

        node = Node.new(value)

        if index == @size
            @tail = node
        end

        if index == 1
            @size += 1
            node = Node.new(value,@head)
            @head = node
            return 
        end

        x = index - 2 
        current = @head

        x.times do 
            current = current.next_node
        end
        nextnode = current.next_node
        current.next_node = node
        node.next_node = nextnode
        @size += 1
    end

    def remove_at(index)
        current = @head
        x = index - 2
        if index > @size
            false
        end
        if index == 1
            @head = current.next_node
            return
        end
        
        x.times do 
            current = current.next_node    
        end
        nextnext = current.next_node.next_node
        current.next_node = nextnext

        if index == @size
            @tail = current
        end
        @size -= 1
    end

end

class Node
    attr_accessor :value, :next_node

    def initialize(value = nil,next_node=nil)
        @value = value
        @next_node = next_node
    end
end

a = LinkedList.new
a.append("Ali")
a.append("Bula")
a.prepend("Dani")
a.prepend("Eldana")
a.append("Ers")
a.pop
puts a.size
puts a.head
puts a.at(3)
puts a.contains?("Ers")
a.remove_at(2)
a.insert_at("Erss",2)
a.to_s