namespace :dev do
    desc "Setup development environment"
    task setup: :environment do
        if Rails.env.development?
        show_spinner("Dropping DB...") { %x(rails db:drop:_unsafe) }
        show_spinner("Creating DB...") { %x(rails db:create) }
        show_spinner("Migrating DB...") { %x(rails db:migrate) }
        show_spinner("Seeding DB...") { %x(rails dev:createRandomWords) }
        else
            puts "You're not in a development environment"
        end
    end

    desc "Register random words"
    task createRandomWords: :environment do
        130.times do |c|
            randomWord = RandomWord.adjs.next
            if randomWord.include?("_") 
                next
            else
                if randomWord.size > 10
                    next
                end
            end
            Word.create!(
                word: randomWord.upcase
            )
        end
    end

    private 
    def show_spinner(msg_start)
        spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
        spinner.auto_spin
        yield
        spinner.success('(Done!)')
    end
end
