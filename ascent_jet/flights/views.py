from __future__ import absolute_import
import logging

from django.views.generic.base import TemplateView
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_exempt

from .api import get_flight_request, get_flight_requests, get_offer_request


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
