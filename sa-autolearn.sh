#!/bin/bash
sa-learn --username=amavis --spam /var/vmail/jaando-software.de/dominik/Maildir/.Spam/cur
sa-learn --username=amavis --spam /var/vmail/jaando-software.de/dominik/Maildir/.Junk/cur
sa-learn --username=amavis --spam "/var/vmail/jaando-software.de/dominik/Maildir/.Junk E-mail/cur"

