#!/usr/bin/env python
import smtplib
import csv
import logging
from datetime import datetime, timedelta
from ConfigParser import SafeConfigParser
import utils
import confparser 


log = logging.getLogger(__name__)


MAILSLIST = confparser._CFG_['csv_path']
SMTP_SERVER = confparser._CFG_['server']
SMTP_PORT = confparser._CFG_['port']
USERNAME = confparser._CFG_['user']
PASSWORD = confparser._CFG_['passwd']


def send_mail(recipient, subject, body):
    if isinstance(recipient, list):
        str_all_mails = ', '.join(recipient)
    else:
        str_all_mails = recipient

    sender, passwd = USERNAME, PASSWORD
    headers = ["From: " + sender,
               "Subject: " + subject,
               "To: " + str_all_mails,
               "MIME-Version: 1.0",
               "Content-Type: text/html"]
    
    headers = "\r\n".join(headers) 
    
    smtp = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
    smtp.ehlo()
    smtp.starttls()
    smtp.ehlo
    smtp.login(sender, passwd)
    
    body = "" + body +""
    smtp.sendmail(sender, recipient, headers + "\r\n\r\n" + body)
    log.info("Sent mail to %s", recipient)
    print "Sent to ", 
    print recipient
    smtp.quit()


def send_happybirthday(recipient):
    log.info("Send happy birthday to %s", recipient)
    body = """Happy birthday to you!
            \n<br/>From C2k8pro with love
            \n<br/>http://c2.familug.org"""
    subject ='[BirthReminder] Happy birthday to you! from C2k8pro'
    send_mail(recipient, subject, body)


def send_notification(all_mails, names):
    log.info("Tomorrow is birthday of %s", names)
    tomorrow = tmr_ddmm_from(datetime.now())
    body = """Tomorrow (%s) is birthday of %s""" % (tomorrow, names)
    subject ='[BirthReminder]' + body
    send_mail(all_mails, subject,  body)


def ddmm_from(date):
    str_format = "%d/%m"
    return date.strftime(str_format)


def tmr_ddmm_from(today):
    one_day = timedelta(days=1)
    tomorrow = today + one_day
    return ddmm_from(tomorrow)

# new function for refactor
def people_from_csv(filename):
    NAME_IDX = 0
    DOB_IDX = 1
    MAIL_IDX = 2

    try:
        with open(MAILSLIST, 'rt') as csvfile:
            reader = csv.reader(csvfile, delimiter=',')
            people = {}
            for row in reader:
                name = row[NAME_IDX].strip()
                dob = row[DOB_IDX]
                dmy = dob.split("/")
                #TODO fix dob with only 1 digit
                sdmbirth = dmy[0] + "/" + dmy[1]
                mail = row[MAIL_IDX]

                people[name] = {'dob': sdmbirth, 'email': mail}
            return people
    except IOError, e:
        print "PLEASE PLACE YOUR CSV DATA FILE TO THIS DIRECTORY"


def mails_from(people):
    all_mails = [people[p]['email'] for p in people]
    all_mails = filter(None, all_mails)
    return all_mails

def check_birthday(date):
    people = people_from_csv(MAILSLIST)
    all_mails = mails_from(people)
    stoday = ddmm_from(date)
    stomorrow = tmr_ddmm_from(date)

    tomorrow_birth = []
    today_birth = []
    for name in people:
        sdmbirth = people[name]['dob']
        if stoday == sdmbirth:
            today_birth.append(name)
            log.info("Today is %s's birthday" % name)
            try:
                send_happybirthday(people[name]['email'])
            except Exception, e:
                log.error(e)

        elif stomorrow == sdmbirth:
            tomorrow_birth.append(name)
            log.info("Tomorrow is %s's birthday" % name)

    if tomorrow_birth:
        all_tomorrow = ', '.join(tomorrow_birth)
        send_notification(all_mails, all_tomorrow)

    return (len(today_birth), len(tomorrow_birth))
        

# TODO rewrite
def main():
    LOG_PATH = "birthreminder.log"
    logging.basicConfig(level=logging.DEBUG,
                        filename=(utils.fix_path(LOG_PATH)), 
                        format="%(asctime)s %(name)s %(levelname)s %(message)s",)
    today = datetime.today()
    stoday = ddmm_from(today)
    log.info("Checking %s ..." % stoday + "...")
    ctd, ctmr = check_birthday(today)
    log.info("Checked %s , %d today - %d tomorrow" % (stoday, ctd, ctmr))

    #send_mail(["bot.c2k8pro@gmail.com"], "Checked", ddmm_from(datetime.now()))


def test():
    pp = people_from_csv(MAILSLIST)
    mails = mails_from(pp)
    print pp
    print mails
    date = datetime(2013, 2, 9)
    check_birthday(date)

if __name__ == "__main__":
    main()
