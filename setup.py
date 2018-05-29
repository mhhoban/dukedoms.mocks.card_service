from setuptools import setup, find_packages

setup(
  name='dukedomsmockscardservice',
  version='0.0.0',
  description='mock card service for component testing for Dukedoms of Daleria microservices',
  packages=find_packages(),
  package_data={
    'dukedoms_mock_card_service': ['swagger/mock_card_service_api.yaml']
  },
  install_requires=[
    'addict',
    'connexion',
    'flask',
    'flask_api'
  ]
)
