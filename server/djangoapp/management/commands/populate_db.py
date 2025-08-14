from django.core.management.base import BaseCommand

from djangoapp.populate import initiate


class Command(BaseCommand):
    help = "Populates the database with initial car make and car model data"

    def handle(self, *args, **kwargs):
        try:
            initiate()
            self.stdout.write(self.style.SUCCESS("Successfully populated the database with car makes and car models"))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f"Error populating database: {str(e)}"))
