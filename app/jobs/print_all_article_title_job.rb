class PrintAllArticleTitleJob < ApplicationJob
  #queue_as :default                  # 默认队列名称
  #queue_as :new_queue_name           # 新命名队列名


  queue_as do                         # 块中动态决定,队列名称
    puts '--------------------'
    puts self.arguments               # arguments 指perform中传入的参数
    puts '-------------------'
    :block_queue_name
  end

  ################################## 入队回调 ######################################
  before_enqueue do |job|
    puts "进入#{job}队列前"
  end

  around_enqueue do |job, block|
    puts "around#{job}队列前"

    block.call
    # ps: block.call后，会执行after_enqueue

    puts "around #{job}队列后"
  end

  after_enqueue do |job|
    puts "进入#{job}队列后"
  end

  ################################# 执行回调 #########################################
  # PS: 执行回调过程，只有在sidekiq中可查看
  before_perform do |job|
    puts '队列执行前'
  end

  around_perform do |job, block|
    puts '队列执行 blcok 块前'

    block.call
    # PS： 这里和入队类似, block.call后，执行after_perform 
    puts '队列执行 block 块后'
  end

  after_perform do |job|
    puts '队列执行后'
  end

  ############################# 队列异常捕获 #########################################
  #PS: 未捕获异常的情况下，sidekiq 中会出现错误
  #    捕获异常时，异常处理信息，在sidekiq中可查看
  rescue_from ActiveRecord::RecordNotFound do |exception|
    puts "异常信息： #{exception.message}"
  end

  def perform(article=nil, test_exception=false)

    Article.find(10000000) if test_exception

    if article
      # GlobalID 可传对象
      puts "传入文章对象内容是：#{article.text}"
    end

    Article.all.each do |article|
      puts article.title
    end
  end


  ##################################### 队列使用 ######################################
  # PrintAllArticleTitleJob.perform_later                                            有空就会立即执行
  # PrintAllArticleTitleJob.perform_now                                              不进队列直接执行（类似于普通方法）
  # PrintAllArticleTitleJob.perform_later(Article.first)                             传参数
  # PrintAllArticleTitleJob.set(wait: 1.minute).perform_later                        一分钟后执行
  # PrintAllArticleTitleJob.set(wait_until: Time.current + 30.second).perform_later  直到当前时间加30秒才执行
  # PrintAllArticleTitleJob.set(queue: 'default').perform_later                      设置队列名（优先级更高）

end
