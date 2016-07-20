from django.core.mail import EmailMultiAlternatives
from django.conf import settings

from django.core.mail import send_mail
import smtplib
import email.utils
from email.mime.text import MIMEText


def send_contact_email_to_ascent_jet(contact):
    smtp = smtplib.SMTP_SSL("secure.emailsrvr.com", 465)
    msg = MIMEText("""%s""" % contact.message)
    msg['Subject'] = u'New contact form submitted by %s' % contact.email
    msg['From'] = '%s <%s>' % (contact.first_name, contact.email)
    msg['To'] = settings.DEFAULT_TO_EMAIL
    smtp.login("noreply@ascentjet.com", "1Nfromati0n")
    from_email = '%s <%s>' % (contact.first_name, contact.email)
    to = settings.DEFAULT_TO_EMAIL
    try:
        smtp.sendmail(from_email, to, msg.as_string())
    finally:
        smtp.quit()
