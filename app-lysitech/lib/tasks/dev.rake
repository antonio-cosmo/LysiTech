namespace :dev do
  desc "Configuração do ambiente"
  task setup: :environment do
    puts %x(rails db:drop db:create db:migrate db:seed)
  end

end
