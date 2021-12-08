namespace :dev do
  desc "configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      
      show_spinner("drop DB") do
        puts %x(bundle exec rails db:drop)
      end

      show_spinner("create DB") do
        puts %x(bundle exec rails db:create)
      end

      show_spinner("migrate DB") do
        puts %x(bundle exec rails db:migrate)
      end

      show_spinner("seed DB") do
        puts %x(bundle exec rails db:seed)
      end

    else
      puts "Você não está no ambiente de desensolvimento!"
    end
  end

  def show_spinner(m_star, m_end = "successful")
    spinner = TTY::Spinner.new("[:spinner] #{m_star}")
    spinner.auto_spin
    yield 
    spinner.success("(#{m_end})")
  end

end


