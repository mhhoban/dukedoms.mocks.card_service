from flask_api import status
from dukedoms_mock_card_service.card_list import card_catalog

def get_card_catalog():
    return card_catalog

def get_card_info(cardIds):
    card_ids=cardIds
    try:
        cards = [card_catalog[id] for id in card_ids]
        return cards
    except KeyError:
        return status.HTTP_404_NOT_FOUND
