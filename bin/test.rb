user = User.find_by_email('alex.korsak@gmail.com')
artist = User.find_by_name('Majestic Casual')
auth_token = user.authentications.facebook.auth_token
facebook_id = user.facebook_id
Aggregator::Workers::BaseWorker.perform_async(auth_token, facebook_id, 'me', recent: true)
