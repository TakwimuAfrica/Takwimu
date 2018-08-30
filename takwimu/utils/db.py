from django.core.serializers import base, python
from django.core.management import call_command
from django.db import migrations

LOAD_DATA_COMMAND = 'loaddata'

def migrate_fixture(apps, fixture_name, app_label='takwimu'):

    # Save the current `_get_model()` function
    saved_get_model = python._get_model

    # We can't import the model directly in the migration as it may be a newer
    # version than the running migration expects. We must use the historical
    # version via `apps`
    def _get_model(model_identifier):
        try:
            return apps.get_model(model_identifier)
        except (LookupError, TypeError):
            raise base.DeserializationError("Invalid model identifier: '%s'" % model_identifier)

    # Use the custom `_get_model()` in `loaddata`.
    python._get_model = _get_model

    try:
        call_command(LOAD_DATA_COMMAND, fixture_name, app_label=app_label)
    finally:
        # Restore the current `_get_model()` function
        python._get_model = saved_get_model
