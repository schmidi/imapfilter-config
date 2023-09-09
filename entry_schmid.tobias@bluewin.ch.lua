-- Options
options.timeout = 20
options.subscribe = true

-- Accounts

account1 = IMAP {
    server = 'imaps.bluewin.ch',
    username = '',
    password = '',
    ssl = 'auto'                                                                                                                                                                                                                                                           
}

-- Mail rules

---------------
-- Social Media
---------------

-- Strava
messages = account1.INBOX:contain_from('strava.com')
account1.INBOX:move_messages(account1['SocialMedia/Strava'], messages)

-- Twitter
messages = account1.INBOX:contain_from('postmaster.twitter.com')
account1.INBOX:move_messages(account1['SocialMedia/Twitter'], messages)

-- Github

messages = account1.INBOX:contain_from('@github.com')
account1.INBOX:move_messages(account1['SocialMedia/github'], messages)

-- Facebook
messages = account1.INBOX:contain_from('facebookmail.com')
+ account1.INBOX:contain_from('facebook.com')
+ account1.INBOX:contain_from('instagram.com')
account1.INBOX:move_messages(account1['SocialMedia/Facebook'], messages)


------------
-- Shopping
------------

-- digitec
messages =  account1.INBOX:contain_from('digitec.ch') +
            account1.INBOX:contain_from('galaxus.ch')
account1.INBOX:move_messages(account1['Bestellungen'], messages)

-- Coop
messages = account1.INBOX:contain_from('coop.ch')
account1.INBOX:move_messages(account1['Bestellungen/Coop'], messages)

-- Migros
messages = account1.INBOX:contain_from('migros.ch')
account1.INBOX:move_messages(account1['Bestellungen/Migros'], messages)

-- EBay
messages = account1.INBOX:contain_from('reply.ebay.ch') +
           account1.INBOX:contain_from('ebay.ch') + 
           account1.INBOX:contain_from('ricardo.ch')
account1.INBOX:move_messages(account1['Bestellungen/eBay - Ricardo'], messages)

messages = account1.INBOX:contain_from('swisspass.ch')
account1.INBOX:move_messages(account1['Bestellungen/SBB'], messages)

----------
-- Syslog
----------

-- Brother DCP-9055CDN
messages = account1.INBOX:contain_subject('E-Mail-Bericht') +
        account1.INBOX:contain_body('Farblaser_Tobias')
account1.INBOX:move_messages(account1['Syslogs/Brother-DCP9055CDN'], messages)

-- Firewall
messages = account1.INBOX:contain_subject('fw.schmid') 
+ account1.INBOX:contain_subject('fw-01.schmid')
account1.INBOX:move_messages(account1['Syslogs/pfSense'], messages)

-- Firewall
messages = account1.INBOX:contain_from('netatmo.com')
account1.INBOX:move_messages(account1['Syslogs/Netatmo'], messages)

-- WLAN AP
messages = account1.INBOX:contain_subject('Zyxel NWA113-NI AP')
account1.INBOX:move_messages(account1['Syslogs/Zyxel NWA113-NI AP'], messages)

-- Smokeping
messages = account1.INBOX:contain_from('smokeping@darky.ch') + account1.INBOX:contain_subject('SmokeAlert')
account1.INBOX:move_messages(account1['Syslogs/Smokeping'], messages)

-- Wordpress
messages = account1.INBOX:contain_from('wordpress@blog.darky.ch')
account1.INBOX:move_messages(account1['Syslogs/Wordpress'], messages)

-- Jenkins
messages = account1.INBOX:contain_subject('Jenkins')
account1.INBOX:move_messages(account1['Syslogs/Jenkins'], messages)

-- schmid-vm-01
messages = account1.INBOX:contain_from('schmid-vm-01@darky.ch')
account1.INBOX:move_messages(account1['Syslogs/schmid-vm-01'], messages)

 -- schmid-k3s
messages = account1.INBOX:contain_subject('schmid-k3s')
account1.INBOX:move_messages(account1['Syslogs/schmid-k3s'], messages)

-- Zabbix
messages = account1.INBOX:contain_subject('Zabbix') 
            + account1.INBOX:contain_to('zabbix@darky.ch')
account1.INBOX:move_messages(account1['Syslogs/Zabbix'], messages)


----------
-- Vereine
----------

-- VMK
messages = account1.INBOX:contain_from('urs.studer@spital.so.ch') +
    account1.INBOX:contain_from('urs.studer@sunrise.ch') +
    account1.INBOX:contain_from('claudilu@gmx.ch') +
    account1.INBOX:contain_from('mgh@besonet.ch') +
    account1.INBOX:contain_from('mueller.beat@bluewin.ch') +
    account1.INBOX:contain_from('us.studer@bluewin.ch') +
    account1.INBOX:contain_from('vm-kriegstetten.ch') +
    account1.INBOX:contain_from('tina.schnyder@gmail.com') +
    account1.INBOX:contain_from('belinda.flury@outlook.com') +
    account1.INBOX:contain_from('f.pianoforte@bluewin.ch') + 
    account1.INBOX:contain_from('schnyder.lara@gmail.com') 
account1.INBOX:move_messages(account1['Vereine/VMK'], messages)

-- Air Base Flyers
messages = account1.INBOX:contain_from('club@flugbasis.ch')
account1.INBOX:move_messages(account1['Vereine/Airbase_Flyers'], messages)


--------
-- Sport
--------

-- Gleitschirm
messages = account1.INBOX:contain_subject('Swiss League Info') +
           account1.INBOX:contain_from('info@swissleague.ch') + 
           account1.INBOX:contain_from('shv-fsvl.ch') + 
           account1.INBOX:contain_from('club@flugbasis.ch')
account1.INBOX:move_messages(account1['Sport/Gleitschirm'], messages)

messages = account1.INBOX:contain_from('flugbuch@darky.ch') * 
           account1.INBOX:is_older(1)
account1.INBOX:move_messages(account1['Sport/Gleitschirm'], messages)
           

-- Unisport
messages = account1.INBOX:contain_from('Unisport Bern') + account1.INBOX:contain_from('@sport.unibe.ch')
account1.INBOX:move_messages(account1['Sport/Unisport'], messages)



------------
-- Diverses
------------

-- Immobilien
messages = account1.INBOX:contain_subject('Immobilien')
account1.INBOX:move_messages(account1['Immobilien'], messages)


-- JobMail
messages = account1.INBOX:contain_from('jobmail@jobs.ch')  +
           account1.INBOX:contain_from('info@jobs.ch') +
           account1.INBOX:contain_from('info@jobcloud.ch') +
           account1.INBOX:contain_from('@xing.com') +
           account1.INBOX:contain_from('@linkedin.com') +
       account1.INBOX:contain_from('XING')
account1.INBOX:move_messages(account1['Job-Mail'], messages)

-- radonstorage
messages =  account1.INBOX:contain_subject('radonstorage') +
            account1.INBOX:contain_subject('RTRR job')
account1.INBOX:move_messages(account1['Syslogs/radonstorage'], messages)


-- Webspace
messages = account1.INBOX:contain_from('cyon.ch')
account1.INBOX:move_messages(account1['Webspace'], messages)

-------------
-- Newsletter
-------------

-- Kofmehl
messages = account1.INBOX:contain_from('kofmehl-info@lists.solnet.ch')
account1.INBOX:move_messages(account1['Newsletter'], messages)

-- Diverse
messages = account1.INBOX:contain_subject('Newsletter') +
           account1.INBOX:contain_from('Newsletter') +
           account1.INBOX:contain_body('Newsletter') +
           account1.INBOX:contain_from('e-assura@assura.ch') 
account1.INBOX:move_messages(account1['Newsletter'], messages)
