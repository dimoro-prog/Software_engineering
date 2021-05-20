module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    @commands = ['get', 'post', 'put', 'delete', 'index', 'show', 'q']

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit:  '
      verb = gets.chomp.downcase
      break if verb == 'q'

      action = nil

      if verb == 'get'
        loop do
          print 'Choose action (index/show) / q to exit: '
          action = gets.chomp.downcase
          break if action == 'q'

          unless @commands.include?(action)
            print "Неизвестная get команда\n"
            next
          end
          break
        end
        break if action == 'q'
      end

      unless @commands.include?(verb)
        print "Неизвестная команда\n"
        next
      end

      action.nil? ? routes[verb].call : routes[verb][action].call

    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    puts "Posts\nID\tComment"
    @posts.each_with_index do |post, index|
      puts("#{index} #{post}")
    end
  end

  def show
    puts('Введите Id')
    id = gets.to_i
    if id >= @posts.length
      puts('Некорентный id')
    else
      puts("#{id} #{@posts[id]}")
    end
  end

  def create
    puts('Введите текст поста')
    text = gets.chomp
    @posts.append(text)
    puts("#{@posts.length - 1} #{text}")
  end

  def update
    puts('Введите id')
    id = gets.to_i
    if id >= @posts.length
      puts('Некорентный id')
    else
      puts('Введите текст нового поста')
      text = gets.chomp
      @posts[id] = text
      puts("#{id} #{@posts[id]}")
    end
  end

  def destroy
    puts('Введите id')
    id = gets.to_i
    if id >= @posts.length
      puts('Некорентный id')
    else
      @posts.delete_at(id)
    end
  end
end

class CommentsController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    puts "Comments\nID\tComment"
    @comments.each_with_index do |comment, index|
      puts("#{index}\t#{comment}")
    end
  end

  def show
    puts('Введите id')
    id = gets.to_i
    if id >= @comments.length
      puts('Некорентный id')
    else
      puts("#{id} #{@comments[id]}")
    end
  end

  def create
    puts('Введите комментарий')
    text = gets.chomp
    @comments.append(text)
    puts("#{@comments.length - 1} #{text}")
  end

  def update
    puts('Введите id')
    id = gets.to_i
    if id >= @comments.length
      puts('Некорентный id')
    else
      puts('Введите новый текст комментария')
      text = gets.chomp
      @comments[id] = text
      puts("#{id} #{@comments[id]}")
    end
  end

  def destroy
    puts('Введите id')
    id = gets.to_i
    if id >= @comments.length
      puts('Некорентный id')
    else
      @comments.delete_at(id)
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentsController, 'comments')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp.downcase

      PostsController.connection(@routes['posts']) if choise == '1'
      CommentsController.connection(@routes['comments']) if choise == '2'
      break if choise == 'q'

    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'get' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'post' => controller.method(:create),
      'put' => controller.method(:update),
      'delete' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init