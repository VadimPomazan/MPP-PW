# frozen_string_literal: true

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(key)
    @root = insert_recursive(@root, key)
  end

  def search(key)
    search_recursive(@root, key)
  end
  def print_tree
    print_recursive(@root, 0)
  end
  private

  def insert_recursive(node, key)
    return Node.new(key) if node.nil?

    if key < node.key
      node.left = insert_recursive(node.left, key)
    elsif key > node.key
      node.right = insert_recursive(node.right, key)
    end

    node
  end

  def search_recursive(node, key)
    return nil if node.nil?

    if key == node.key
      puts "Елемент #{key} знайдено!"
      return node
    elsif key < node.key
      puts "Шукаємо у лівому піддереві (ключ #{node.key})"
      return search_recursive(node.left, key)
    else
      puts "Шукаємо у правому піддереві (ключ #{node.key})"
      return search_recursive(node.right, key)
    end
  end

  def print_recursive(node, level)
    return if node.nil?

    print_recursive(node.right, level + 1)

    indent = '  ' * level
    puts "#{indent}#{node.key}"

    print_recursive(node.left, level + 1)
  end
end
class Node
  attr_accessor :key, :left, :right

  def initialize(key)
    @key = key
    @left = nil
    @right = nil
  end
end

#Код клієнта

# Створюємо нове бінарне дерево
binary_tree = BinaryTree.new

# Вставляємо елементи
binary_tree.insert(5)
binary_tree.insert(3)
binary_tree.insert(7)
binary_tree.insert(1)
binary_tree.insert(4)
binary_tree.insert(6)
binary_tree.insert(8)
binary_tree.insert(9)


binary_tree.search(4)
binary_tree.print_tree




