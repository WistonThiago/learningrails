module ArticlesHelper
    def date_post(datetime)
        datetime.strftime('%B %e, %Y')
    end
end
