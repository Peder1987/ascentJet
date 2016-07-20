from __future__ import absolute_import
import logging
import os, sys
from django.http import HttpResponse

from django.views.generic.base import TemplateView
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_exempt

from .api import get_flight_request, get_flight_requests, get_offer_request, aircraft_images

from fpdf import FPDF
from django.http import JsonResponse

from django.conf import settings
from django.core.mail import send_mail
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.image import MIMEImage

import json

TEMPLATE_DIR = os.path.join(os.getcwd(), 'common/templates/preview/structure/')
IMAGE_DIR = os.path.join(os.getcwd(), 'common/static/images/emails/')
# Get an instance of a logger
logger = logging.getLogger('ascent_jet.custom')


"""
Flight statuses:
REQUEST_CREATED - status on initial request creation, operators haven't issued any offers yet
REQUEST_HAS_OFFERS - operators have issued offers, which are not paid by end user yet
REQUEST_BOOKED - status set when client completes passengers details

Offers statuses:
PENDING (previously OFFER_MADE_BY_OPERATOR) - offer created by operator
ACCEPTED (should be OFFER_PAID) - Offer accepted by user and payment received and not accepted by operator
OFFER_UPDATED - price changed for allready paid offer
OFFER_NOT_AVAILABLE - offer revoked by operator
OFFER_CONFIRMED_BY_OPERATOR - offer was paid by customer and operator confirmed availability
"""

class PDF(FPDF):
    def header(self):
        # Logo
        self.set_font('Arial', 'B', 15)
        # Move to the right
        self.cell(80)
        # Title
        logo_path = os.getcwd() + '/ascent_jet/media/images/logo.png'
        self.image(logo_path, 85, 10, 45)
        #self.cell(30, 10, 'Title', 1, 0, 'C')
        # Line break
        self.ln(10)

    # Page footer
    def footer(self):
        # Position at 1.5 cm from bottom
        self.set_y(-15)
        # Arial italic 8
        self.set_font('Arial', 'I', 8)
        # Page number
        self.cell(0, 10, 'Page ' + str(self.page_no()) + '/{nb}', 0, 0, 'C')
    def __unicode__(self):
        return self.name

def generate_pdf(self, **kwargs):
    # Instantiation of inherited class
    # get the offer infos

    invoice = []
    if kwargs.get('id', None) is not None:
        invoice = get_flight_request(kwargs['id'], self.COOKIES)
        if invoice:
            if invoice.offers:
                for offer in invoice.offers:

                    pdf = PDF()
                    pdf.alias_nb_pages()
                    pdf.add_page()

                    #pdf.cell(0, 10, offer.provider, 0, 1)

                    pdf.set_font('Arial', 'B', 12)
                    pdf.cell(50, 10, 'Aircraft / Type :', 0)
                    pdf.set_font('Times', '', 12)
                    pdf.cell(0, 10, offer.aircraft_type + ' / ' + offer.aircraft_category, 0)
                    pdf.ln(8)

                    pdf.set_font('Arial', 'B', 12)
                    pdf.cell(50, 10, 'Price :', 0)
                    pdf.set_font('Times', '', 12)
                    pdf.cell(0, 10, offer.currency + ' ' + offer.price, 0)
                    pdf.ln(8)

                    pdf.set_font('Arial', 'B', 12)
                    pdf.cell(50, 10, 'Offer created :', 0)
                    pdf.set_font('Times', '', 12)
                    pdf.cell(0, 10, offer.created_date, 0)
                    pdf.ln(8)

                    pdf.set_font('Arial', 'B', 12)
                    pdf.cell(50, 10, 'Flight Times:', 0)
                    pdf.set_font('Times', '', 12)
                    legIndex = 0
                    for lo in offer.leg_offers:
                        if legIndex == 0:
                            pdf.cell(50, 10, lo.from_airport + ' (' + lo.from_code + ')  -  ' + lo.to_airport + ' (' + lo.to_code + ')  -  '
                                + lo.flight_time_hrs + 'h ' + lo.flight_time_min + 'm', 0)
                        else:
                            pdf.ln(6)
                            pdf.cell(50, 10, '', 0)
                            pdf.cell(50, 10, lo.from_airport + ' (' + lo.from_code + ')  -  ' + lo.to_airport + ' (' + lo.to_code + ')  -  '
                                     + lo.flight_time_hrs + 'h ' + lo.flight_time_min + 'm', 0)

                        legIndex += 1

                    pdf.ln(8)
                    pdf.set_font('Arial', 'B', 12)
                    pdf.cell(50, 10, 'Passengers:', 0)
                    pdf.set_font('Times', '', 12)
                    pdf.cell(0, 10, str(offer.leg_offers[0].pax), 0)
                    pdf.ln(8)

                    pdf.set_font('Arial', 'B', 12)
                    pdf.cell(50, 10, 'Baggage:', 0)
                    pdf.set_font('Times', '', 12)
                    pdf.cell(0, 10, invoice.baggage, 0)
                    pdf.ln(8)

                    pdf.set_font('Arial', 'B', 12)
                    pdf.cell(50, 10, 'Additional Requests:', 0)
                    pdf.set_font('Times', '', 12)
                    pdf.cell(0, 10, str(invoice.additional_info), 0)
                    pdf.ln(8)

                    pdf.ln(6)
                    pdf.set_font('Arial', 'B', 14)
                    pdf.cell(50, 10, 'Aircraft Detail')

                    pdf.ln(8)
                    pdf.set_font('Arial', 'B', 12)
                    pdf.cell(50, 10, 'Tail Number:')
                    pdf.set_font('Times', '', 12)
                    pdf.cell(0, 10, str(offer.tail_number), 0)
                    pdf.ln(8)

                    pdf.set_font('Arial', 'B', 12)
                    pdf.cell(50, 10, 'Year of construction:')
                    pdf.set_font('Times', '', 12)
                    pdf.cell(0, 10, str(offer.constructed), 0)
                    pdf.ln(8)

                    pdf.set_font('Arial', 'B', 12)
                    pdf.cell(50, 10, 'Number of seats:')
                    pdf.set_font('Times', '', 12)
                    pdf.cell(0, 10, str(offer.seats), 0)
                    pdf.ln(8)

                    #pdf.cell(50, 10, '')
                    #for image in offer.image_ids:
                        #if image['type'] == 'AIRCRAFT_IMAGE':
                            #aircraft_img_url = str(offer.aircraft_id) + '/' + str(image['id'])
                            #aircraft_img_url = 'http://ascentjet.com/rest/aircraft/images/74/202'
                            #aircraft_img_path = aircraft_images(aircraft_img_url, self.COOKIES)
                            #pdf.image(aircraft_img_path, 50, 10, 33)
                            #pdf.image(aircraft_img_url, 50, 10, 45)

                    pdf.output('invoice.pdf', 'F')
                    response = HttpResponse(content_type='application/pdf')
                    response.write(pdf.buffer)

                    return response
        else:
            return None


class FlightView(TemplateView):
    template_name = "flights/flight.html"

    def get_context_data(self, **kwargs):
        context = super(FlightView, self).get_context_data(**kwargs)
        logger.info("context:%s" % context)

        booked_requests = []
        flight_requests = []
        flights = get_flight_requests(self.request.COOKIES)
        if flights and len(flights) > 0:
            # group flights
            for flight in flights:
                logger.info("flight: %s, status: %s" % (flight.id, flight.status))
                if flight.status == "REQUEST_CREATED" or flight.status == "REQUEST_HAS_OFFERS":
                    flight_requests.append(flight)
                if flight.status == "REQUEST_BOOKED":
                    booked_requests.append(flight)
            context['flight_requests'] = flight_requests
            context['booked_requests'] = booked_requests

        logger.info("flights :%s" % flights)

        if kwargs.get('id', None) is not None:
            context["flight"] = get_flight_request(kwargs['id'], self.request.COOKIES)
            if context["flight"]:
                logger.info("flight status: %s" % context["flight"].status)
                if context["flight"].offers:
                    for o in context["flight"].offers:
                        logger.info("offer: %s, status: %s" % (o.id, o.status))
            context["is_booked"] = is_booked(context["flight"], booked_requests)

        else:
            # no id in request, fetch the first request from list
            if flights and len(flights) > 0:
                context["flight"] = get_flight_request(flights[0].id, self.request.COOKIES)
                context["is_booked"] = is_booked(context["flight"], booked_requests)
            else:
                return None

        return context

flight_request = FlightView.as_view()


def is_booked(flight, booked_requests):
    if not flight:
        return False
    is_booked = False
    for br in booked_requests:
        if flight.id == br.id:
            is_booked = True
    return is_booked


class OfferStatusView(TemplateView):
    template_name = "preview/structure/error.html"

    @method_decorator(csrf_exempt)
    def dispatch(self, *args, **kwargs):
        return super(OfferStatusView, self).dispatch(*args, **kwargs)

    def post(self, request, **kwargs):
        logger.info("request: %s" % self.request)
        # if success, get original flight, and only current offer
        if request.POST.get("status", None) == "success":
            offer = get_offer_request(request.POST.get("refno", None), self.request.COOKIES)
            kwargs["offer"] = offer
            self.template_name = "preview/structure/success.html"
            # flight.offers = [offer]

        return render(request, self.template_name, self.get_context_data(**kwargs))

offer_status = OfferStatusView.as_view()


class GetAQuoteView(TemplateView):
    template_name = "flights/get-a-quote.html"

get_a_qoute = GetAQuoteView.as_view()

# u'errorCode': [u'1403'],
# u'errorDetail': [u'Declined'],
# u'errorMessage': [u'declined'],
# u'acqErrorCode': [u'50'],


class BookingView(TemplateView):
    template_name = "booking.html"

    @method_decorator(csrf_exempt)
    def dispatch(self, *args, **kwargs):
        return super(BookingView, self).dispatch(*args, **kwargs)

    def post(self, request, *args, **kwargs):
        context = super(BookingView, self).get_context_data(**kwargs)
        return super(TemplateView, self).render_to_response(context)

booking_request = BookingView.as_view()


class SendEmailOnPaymentSuccess(TemplateView):
    def get(self, request, *args, **kwargs):

        bookData_json = request.GET.get('data')
        bookId = request.GET.get('id')
        userEmail = request.GET.get('userEmail')
        bookData = json.loads(bookData_json)

        userName = request.GET.get('userName')
        bookingNo = bookData['tripRequestId']
        aircraftType = bookData['aircraft']['type']
        operatorInfo = bookData['provider']
        departure = bookData['legOffers'][0]['departureDate'] + ' - ' + bookData['legOffers'][0]['departureTime']
        fromInfo = bookData['legOffers'][0]['fromAirportObj']['city'] + ' (' + bookData['legOffers'][0]['fromAirportObj']['code'] + ' ) to '
        toInfo = bookData['legOffers'][0]['toAirportObj']['city'] + ' (' + bookData['legOffers'][0]['toAirportObj']['code'] + ' )'
        flightInfo = fromInfo + toInfo
        price = bookData['currency'] + ' ' + bookData['price']

        content = open(TEMPLATE_DIR + 'email-booking-available.html').read()
        content = content.replace('{{ userName }}', str(userName))
        content = content.replace('{{ bookingNo }}', str(bookingNo))
        content = content.replace('{{ aircraftType }}', str(aircraftType))
        content = content.replace('{{ operatorInfo }}', str(operatorInfo))
        content = content.replace('{{ departure }}', str(departure))
        content = content.replace('{{ flightInfo }}', str(flightInfo))
        content = content.replace('{{ price }}', str(price))

        smtp = smtplib.SMTP_SSL("secure.emailsrvr.com", 465)

        msg = MIMEMultipart(_subtype='related')
        msg.attach(MIMEText(content, 'html'))

        header_image = open(IMAGE_DIR + 'header.jpg', 'rb').read()
        img = MIMEImage(header_image, 'jpeg')
        img.add_header('Content-Id', '<emailHeader>')
        msg.attach(img)

        footer_image = open(IMAGE_DIR + 'footer.jpg', 'rb').read()
        img = MIMEImage(footer_image, 'jpeg')
        img.add_header('Content-Id', '<emailFooter>')
        msg.attach(img)

        email_mail = open(IMAGE_DIR + 'email.jpg', 'rb').read()
        img = MIMEImage(email_mail, 'jpeg')
        img.add_header('Content-Id', '<emailIcon>')
        msg.attach(img)

        email_phone = open(IMAGE_DIR + 'phone.jpg', 'rb').read()
        img = MIMEImage(email_phone, 'jpeg')
        img.add_header('Content-Id', '<emailPhoneIcon>')
        msg.attach(img)

        cornerImg = open(IMAGE_DIR + 'corner.jpg', 'rb').read()
        img = MIMEImage(cornerImg, 'jpeg')
        img.add_header('Content-Id', '<corner>')
        msg.attach(img)

        msg['Subject'] = 'payment success'
        msg['From'] = '%s <%s>' % ("ascentJet", settings.DEFAULT_FROM_EMAIL)
        msg['To'] = 'pederandes@gmail.com'

        smtp.login("noreply@ascentjet.com", "1Nfromati0n")

        from_email = settings.DEFAULT_FROM_EMAIL
        to = userEmail
        try:
            smtp.sendmail(from_email, to, msg.as_string())
        finally:
            smtp.quit()


        return JsonResponse({'response': request.GET.get('id')})