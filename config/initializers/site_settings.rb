SITE_NAME = 'KP Skills Ltd'
ADMIN_EMAIL = 'info@kpskills.co.uk'
EMAIL_FROM = 'KP Skills Website <web@kpskills.co.uk>'

RECAPTCHA_PUBLIC_KEY = '6Lda2LoSAAAAAOH3O9rSTX6BfUBZWgfIC0UaqNlO'
RECAPTCHA_PRIVATE_KEY = '6Lda2LoSAAAAAGUy0-BZv5Itg7EJxHdTJUTrXjYL'
ENV['RECAPTCHA_PUBLIC_KEY'] = '6Lda2LoSAAAAAOH3O9rSTX6BfUBZWgfIC0UaqNlO'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6Lda2LoSAAAAAGUy0-BZv5Itg7EJxHdTJUTrXjYL'

Money.default_currency = Money::Currency.new("GBP")

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => "smtp.sendgrid.net",
    :domain => "kpskills.co.uk",
    :user_name => "hello@adamcarlile.com",
    :password => "njh9x2"
}
