module ApplicationHelper
   
    def locale(locale)
        I18n.locale == :en ? "Inglês" : "Portugês-Br"
    end
   
    def date_br(date_us)
        date_us.strftime("%d/%m/%Y")
    end
end
