import connexion

app = connexion.App(__name__, specification_dir='swagger/')
app.add_api('mock_card_service_api.yaml')
application = app.app
