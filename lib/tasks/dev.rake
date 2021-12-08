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

      puts %x(bundle exec rails dev:addcoins)
      puts %x(bundle exec rails dev:addtypes)
     
    else
      puts "Você não está no ambiente de desensolvimento!"
    end
  end

  desc "cadastra moedas"
  task addcoins: :environment do
   show_spinner("seed coins DB") do
    
    coins = [
                { description: "Testando",
                acronym: 'TST',
                url_image: "https://cdn.pixabay.com/photo/2014/06/03/19/38/road-sign-361514_960_720.png"
                },
        
                { description: "Bitcoin",
                acronym: "BTC",
                url_image: "https://www.pngall.com/wp-content/uploads/1/Bitcoin-PNG-Pic.png"
                },
        
                { description: "Dash",
                acronym: "DASH",
                url_image: "https://www.shareicon.net/data/2016/07/08/117431_dash_512x512.png"
                },   
                
                { description: "Iota",
                acronym: "IOT",
                url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png"
              },

              { description: "ZCash",
                acronym: "ZEC",
                url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1437.png"
              }
            ]
    
    coins.each do |coin|
        Coin.find_or_create_by!(coin)
    end
   end 
  end
  
  desc "cadastra tipos de mineração"
  task addtypes: :environment do
   show_spinner("seed types DB") do
    
    mining_types = [
         {name: "Proof of Work", acronym: "PoW"},
         {name: "Proof of Stak", acronym: "PoS"},
         {name: "Proof of Capacity", acronym: "PoC"}
    ]
    
    mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
    end
   end 
  end

  def show_spinner(m_star, m_end = "successful")
    spinner = TTY::Spinner.new("[:spinner] #{m_star}")
    spinner.auto_spin
    yield 
    spinner.success("(#{m_end})")
  end

end

